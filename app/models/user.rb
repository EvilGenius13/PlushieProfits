class User < ApplicationRecord
  validates :auth_id, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  has_one :factory, dependent: :destroy
  after_create :create_initial_factory

  private

  def create_initial_factory
    Factory.create(
      user: self,
      name: "Bedroom", # Or any default name you choose
      max_material_storage: 100,
      max_production_capacity: 50,
      max_plushie_storage: 100,
      max_accessory_storage: 100
    )
  end
end
