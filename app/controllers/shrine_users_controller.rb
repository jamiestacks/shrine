class ShrineUsersController < ApplicationController
  def index
    @invites = ShrineUser.where(user_id: current_user.id, status: "pending")
    @family_relationships = ["Aunt", "Brother", "Brother-in-law", "Cousin", "Daughter",
      "Daughter-in-law", "Ex-Husband", "Ex-Partner", "Ex-Wife",
      "Extended Family", "Father", "Father-in-law",
      "Granddaughter", "Grandfather", "Grandmother", "Grandson",
      "Great-Granddaughter", "Great-Grandfather", "Great-Grandmother",
      "Great-Grandson", "Great-Uncle", "Great-Nephew", "Great-Niece",
      "Husband", "Mother", "Mother-in-law", "Nephew", "Niece", "Partner",
      "Sister", "Sister-in-law", "Son", "Son-in-law", "Step-Brother",
      "Step-Daughter", "Step-Father", "Step-Granddaughter", "Step-Grandfather",
      "Step-Grandmother", "Step-Grandson", "Step-Mother", "Step-Nephew",
      "Step-Niece", "Step-Sister", "Step-Son", "Uncle"]
    @friendships = ["Business partner", "Colleague", "Childhood friend", "Friend",
      "Gym buddy", "Neighbour", "School friend", "Sports teammate",
      "Student", "Teacher", "University friend"]
  end

  def members
    @shrine = Shrine.find(params[:shrine_id])
    @shrine_creator = @shrine.user

    @shrine_members_accepted = ShrineUser.where(shrine_id: params[:shrine_id], status: "accept").pluck(:user_id)
    @shrine_members = @shrine_members_accepted.map { |user| User.find(user) }
    @sorted_shrine_members = @shrine_members.sort_by { |user| user.family_name }
    @shrine_members_invited = ShrineUser.where(shrine_id: params[:shrine_id], status: "pending").pluck(:user_id)
    @invited_users = @shrine_members_invited.map { |user| User.find(user) }
    @sorted_invited_users = @invited_users.sort_by { |user| user.family_name }
  end

  def new
    @invite = ShrineUser.new
    @invite.shrine_id = Shrine.find(params[:shrine_id])
  end

  def create
    @email = params[:query]
    @user = User.find_by(email: @email)
    @shrine = Shrine.find(params[:shrine_id])
    @invite = ShrineUser.new
    @invite.user = @user
    @invite.shrine = @shrine

    if @invite.save
      redirect_to shrine_path(params[:shrine_id])
      flash[:notice] = "Your Invitation was sent Successfully!"
    else
      render 'shrines/show', status: :unprocessable_entity
      flash[:alert] = "The invite didn't work. Already a member?"
    end
  end

  def update
    shrine_user = ShrineUser.find(params[:id])
    shrine_user.update(status: params[:status])
    if params[:status] == 'accept'
      redirect_to shrine_path(shrine_user.shrine_id)
    else
      redirect_to shrine_users_path(shrine_user.shrine_id)
    end
  end

  private

  def shrine_user_params
    params.require(:shrine_user).permit(:status, :shrine_id, :user_id, :relationship)
  end
end
