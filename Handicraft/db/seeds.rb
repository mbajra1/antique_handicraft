# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all

Product.create(product_id:'TD01',name:'Amitabha',description:%{AMITABHA (Tib. Öpagme) His name means "infinite light". Amitabha is the principal Buddha of Sukhavati, the Blissful Pure Land of the West - a heavenly realm outside ordinary cyclic existence. The "pure land" practices of Amitabha based on devotion and faith are known all over Asia. He is the most venerated figure in the Buddhism of China, Korea and Japan. },image_url:'amitabha.jpg',category:'Thangka',subcategory:'Deities',product_condition:'New',price:200.00, technical_description:'54x56 cm ; 1.0 pound',quantity:5)

Product.create(product_id:'TD02',name:'Vaishravana',description:%{VAISHRAVANA (Tib. Namtotse)The guardian of the North - the countries in our Western hemisphere - represents the deity of wealth holding in his right hand a jewel spitting mongoose. Devotion, offerings and prayers to him are meant to bring unimaginable riches. His left hand holds the banner of victory symbolizing the victorious conquest of the Dharma. },image_url:'vaishravana.jpg',category:'Thangka',subcategory:'Deities',product_condition:'New',price:156.00, technical_description:'17x13 inches; 1.0 pound',quantity:6)

Product.create(product_id:'AR01',name:'Phurba',description:%{Known as kīla in Sanskrit, a phurba is a three-sided peg, stake, dagger, or nail-like ritual instrument often associated with the tantric deity Vajrakīlaya. The phurba is used as a ritual implement to signify stability and to overcome demonic obstacles.  },image_url:'horsehead-dorje-phurba.jpg',category:'Artifact',subcategory:'Ritual Items',product_condition:'New',price:215.00, technical_description:'0.5x6 inches- 2x15 cm; 2.0 pounds',quantity:10)

Product.create(product_id:'AR02',name:'Longevity Vase',description:%{The Longevity Vase or tse-bum is an important ritual-object in Tibetan Buddhism. The Longevity Vase is often used for conferring Longevity Initiations and is also placed on altars and mandalas to symbolize Amitāyus Buddha, the buddha of longevity.  },image_url:'longevity-vase.jpg',category:'Artifact',subcategory:'Ritual Items',product_condition:'New',price:265.00, technical_description:'8.5 inches height; 40.0 pounds',quantity:3)

Product.create(product_id:'JP01',name:'Brass Double Dorje',description:%{A double dorje, or vishvavajra, are two dorjes connected to form a cross. A double dorje represents the foundation of the physical world and is also associated with certain tantric deities.},image_url:'pendant.jpg',category:'Jewellery',subcategory:'Pendants',product_condition:'New',price:5.00, technical_description:'9x9 inches; 8.8 pounds',quantity:2)

Product.create(product_id:'JP02',name:'Medicine Buddha Pendant',description:%{Yakushi (the Medicine Buddha) is the Bodhisattva doctor. He holds a medicine jar in his hand and is attended by twelve gods each of whom represents one of his twelve vows. The main object of his appearance among us is to cure us of ignorance, which is the most fundamental of all the ills the flesh is heir to},image_url:'buddha.jpg',category:'Jewellery',subcategory:'Pendants',product_condition:'New',price:5.00, technical_description:'1.6 oz',quantity:7)


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