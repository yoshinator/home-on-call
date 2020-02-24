require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
  
  # test "Service.search('') returns all services if an empty string is passed" do 
  #   bt = BusinessType.create(name: "Painting")
  #   service1 = Service.create(title: "Interior Painting", content: "blah", business_type_id: bt.id)
  #   service2 = Service.create(title: "Exterior Painting", content: "blooh", business_type_id: bt.id)
  #   service3 = Service.create(title: "Crown Molding Painting", content: "bleep", business_type_id: bt.id)
  #   service4 = Service.create(title: "Junk Removal", content: "tooop", business_type_id: bt.id)
  #   service5 = Service.create(title: "Poop Removal", content: "tooop", business_type_id: bt.id)


  #   assert Service.search("").count, 5
  #   bt.destroy
  #   service1.destroy
  #   service2.destroy
  #   service3.destroy
  #   service4.destroy
  #   service5.destroy
  # end 

  # #   test "Service.search('painting') returns all services whose title contains painting" do 
  #   bt = BusinessType.create(name: "Painting")
  #   service1 = Service.create(title: "Interior Painting", content: "blah", business_type_id: bt.id)
  #   service2 = Service.create(title: "Exterior Painting", content: "blooh", business_type_id: bt.id)
  #   service3 = Service.create(title: "Crown Molding Painting", content: "bleep", business_type_id: bt.id)
  #   service4 = Service.create(title: "Junk Removal", content: "tooop", business_type_id: bt.id)
  #   service5 = Service.create(title: "Poop Removal", content: "tooop", business_type_id: bt.id)

  #   assert Service.search("toople").count, 3
  #   bt.destroy
  #   service1.destroy
  #   service2.destroy
  #   service3.destroy
  #   service4.destroy
  #   service5.destroy
  # end 


end 