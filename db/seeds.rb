# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Hand.destroy_all
Foot.destroy_all
Head.destroy_all

max = User.create(username:'max', email:'maxsmouha@gmail.com', password_digest:'123', bio:'hey its max', single:true)
tony = User.create(username:'tony', email:'creiser@gmail.com', password_digest:'1234', bio:'hey its tony', single:true)
steven = User.create(username:'steven', email:'schen@gmail.com', password_digest:'12345', bio:'hey its steven', single:false)

head1 = Head.create(user_id:max.id)
head2 = Head.create(user_id:tony.id)
head3 = Head.create(user_id:steven.id)

hand1 = Hand.create(user_id:max.id)
hand2 = Hand.create(user_id:tony.id)
hand3 = Hand.create(user_id:steven.id)

foot1 = Foot.create(user_id:max.id)
foot2 = Foot.create(user_id:tony.id)
foot3 = Foot.create(user_id:steven.id)