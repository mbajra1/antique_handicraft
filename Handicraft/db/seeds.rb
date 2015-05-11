# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Customer.delete_all
#Customer.create(customer_id:'CUS01',company:'ABC Company',last_name:'Smith',first_name:'Jane',email:'janesmith@gmail.com',business_phone:'4107711470',home_phone:'4107711450',cell_phone:'4432567814',fax:'4107711471', address:'11235 York Rd', city:'HuntValley', state_province:'MD',zip_postal_code:'21030',country_region:'USA')

Role.create({name: "admin", description: "Can perform any CRUD operation on any resource"})
Role.create({name: "seller", description: "Can read and create items. Can update and destroy own items"})
Role.create({name: "customer", description: "Can read items"})

#Seller.delete_all
#Seller.create(seller_id:'SEL01',company:'Antique Handicraft Company',last_name:'Gurung',first_name:'Dawa',email:'dawagurung@gmail.com',business_phone:'4106611470',home_phone:'4106611450',cell_phone:'4432574981',fax:'4106611471', address:'10235 York Rd', city:'Cockeysville', state_province:'MD',zip_postal_code:'21030',country_region:'USA')


StateTax.delete_all
StateTax.create(state_code:'MD',tax_rate: 0.06)


Discount.delete_all
Discount.create(discount_code:'SPND100GET5',discount_amount: 5.00)


ShippingBook.delete_all
ShippingBook.create(shipping_name:'Jane Smith',shipping_address:'11235 York Rd', shipping_city:'HuntValley', shipping_state_province:'MD',shipping_zip_postal:'21030',shipping_country_region:'USA')
ShippingBook.create(shipping_name:'Jerry Smith',shipping_address:'10104 Woodlake Dr', shipping_city:'Cockeysville', shipping_state_province:'MD',shipping_zip_postal:'21030',shipping_country_region:'USA')