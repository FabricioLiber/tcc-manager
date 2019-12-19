class Request < ApplicationRecord
    belongs_to :student
    belongs_to :document
    belongs_to :teacher


    accepts_nested_attributes_for :document
end
