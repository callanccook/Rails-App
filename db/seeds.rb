# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Based on: http://www.xyzpub.com/en/ruby-on-rails/3.2/seed_rb.html

product_list = [
	['Wedding', 'They can be elegant and traditional, or original.', 'http://bellethemagazine.com/wp-content/uploads/2016/04/winter-wedding-cake-3-200x200.jpg', 'White or Cream', 100],
	['Birthday', 'Birthday cakes are one tier, rounded. Candles not included.', 'https://previews.123rf.com/images/belchonock/belchonock1510/belchonock151004195/47405030-Birthday-cake-with-candles-on-color-background-Stock-Photo-happy.jpg', 'Any color', 30],
	['Cupcake', 'Sizes can be small, medium, or large. Price is by the half dozen.', 'http://www.glorioustreats.com/wp-content/uploads/2011/08/Pretty-colored-cupcakes-200x200.jpg', 'Any color', 6],
	['Square', 'From one to four tiers, they can be centered or off-centered.', 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQYuOpq7sph1MFzxQy4SD036NLg-6sp-Ok_I3Ye5vq0_hf_HJiK', 'Any color', 75],
	['Themed', 'Any theme and any shape.', 'https://cdn001.cakecentral.com/gallery/2016/07/200x200_star-wars-3-d-standing-r2d2-cake-990268VXLxq.jpg', 'Any color', 50],
	['Round', 'Shaped like a circle. Any toppings/flavor', 'http://img-aws.ehowcdn.com/200x200/cme/cme_public_images/www_ehow_com/i.ehow.com/images/a06/jm/o3/put-fondant-round-cake-800x800.jpg', 'Any color', 75],
]

product_list.each do |name, description, image_url, color, price|
  Product.create(name: name, description: description, image_url: image_url, color: color, price: price, created_at: Time.now, updated_at: Time.now)
end
