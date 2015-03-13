# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all

Product.create(product_id:'TD01',name:'Amitabha',description:%{AMITABHA (Tib. Öpagme) His name means "infinite light". Amitabha is the principal Buddha of Sukhavati, the Blissful Pure Land of the West - a heavenly realm outside ordinary cyclic existence. The "pure land" practices of Amitabha based on devotion and faith are known all over Asia. He is the most venerated figure in the Buddhism of China, Korea and Japan. },image_url:'amitabha.jpg',category:'Thangka',subcategory:'Deities',product_condition:'New',price:200.00)

Product.create(product_id:'TD02',name:'Vaishravana',description:%{VAISHRAVANA (Tib. Namtotse)The guardian of the North - the countries in our Western hemisphere - represents the deity of wealth holding in his right hand a jewel spitting mongoose. Devotion, offerings and prayers to him are meant to bring unimaginable riches. His left hand holds the banner of victory symbolizing the victorious conquest of the Dharma. },image_url:'vaishravana.jpg',category:'Thangka',subcategory:'Deities',product_condition:'New',price:156.00)

Product.create(product_id:'AR01',name:'Phurba',description:%{Known as kīla in Sanskrit, a phurba is a three-sided peg, stake, dagger, or nail-like ritual instrument often associated with the tantric deity Vajrakīlaya. The phurba is used as a ritual implement to signify stability and to overcome demonic obstacles.  },image_url:'horsehead-dorje-phurba.jpg',category:'Artifact',subcategory:'Ritual Items',product_condition:'New',price:215.00)

Product.create(product_id:'AR02',name:'Longevity Vase',description:%{The Longevity Vase or tse-bum is an important ritual-object in Tibetan Buddhism. The Longevity Vase is often used for conferring Longevity Initiations and is also placed on altars and mandalas to symbolize Amitāyus Buddha, the buddha of longevity.  },image_url:'longevity-vase.jpg',category:'Artifact',subcategory:'Ritual Items',product_condition:'New',price:265.00)

Product.create(product_id:'JP01',name:'Brass Double Dorje',description:%{A double dorje, or vishvavajra, are two dorjes connected to form a cross. A double dorje represents the foundation of the physical world and is also associated with certain tantric deities.},image_url:'pendant.jpg',category:'Jewellery',subcategory:'Pendants',product_condition:'New',price:5.00)

Product.create(product_id:'JP02',name:'Medicine Buddha Pendant',description:%{Yakushi (the Medicine Buddha) is the Bodhisattva doctor. He holds a medicine jar in his hand and is attended by twelve gods each of whom represents one of his twelve vows. The main object of his appearance among us is to cure us of ignorance, which is the most fundamental of all the ills the flesh is heir to},image_url:'buddha.jpg',category:'Jewellery',subcategory:'Pendants',product_condition:'New',price:5.00)


Customer.delete_all

Customer.create(customer_id:"cid1", password:"ruby", customer_firstname:'vamshi', customer_lastname:'vkorlepara', address:'6914 Taylor Ave, Baltimore, MD, 21230', email_address:'vkorlepara@gmail.com', seller_id:nil)
Customer.create(customer_id:"cid2", password:"ruby", customer_firstname:'manish', customer_lastname:'bajracharya', address:'1200 York Rd, Baltimore, MD, 21230', email_address:'mbajra@gmail.com', seller_id:nil)
Customer.create(customer_id:"cid3", password:"ruby", customer_firstname:'sameer', customer_lastname:'bharati', address:'6914 burke Rd, Baltimore, MD, 21230', email_address:'sbharati@gmail.com', seller_id:nil)

