class ShrineUsersController < ApplicationController

  private

  family_relations = ["Aunt", "Brother", "Brother-in-law", "Cousin", "Daughter",
                      "Daughter-in-law", "Extended Family", "Father", "Father-in-law",
                      "Granddaughter", "Grandfather", "Grandmother", "Grandson",
                      "Great-Granddaughter", "Great-Grandfather", "Great-Grandmother",
                      "Great-Grandson", "Great-Uncle", "Great-Nephew", "Great-Niece",
                      "Husband", "Mother", "Mother-in-law", "Nephew", "Niece", "Partner",
                      "Sister", "Sister-in-law", "Son", "Son-in-law", "Step-Brother",
                      "Step-Daughter", "Step-Father", "Step-Granddaughter", "Step-Grandfather",
                      "Step-Grandmother", "Step-Grandson", "Step-Mother", "Step-Nephew",
                      "Step-Niece", "Step-Sister", "Step-Son", "Uncle"]

  friend_relations = ["Business partner", "Colleague", "Childhood friend", "Friend",
                      "Gym buddy", "Neighbour", "School friend", "Sports teammate",
                      "Student", "Teacher", "University friend"]
end
