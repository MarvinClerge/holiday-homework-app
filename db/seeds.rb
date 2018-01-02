User.destroy_all
50.times do
  name = Faker::Name.first_name + " " + Faker::Name.last_name
  user_name = "#{name.split(" ")[0].downcase}#{rand(50..99)}"
  User.create!(
    username: user_name,
    name: name,
    password: '123',
    color: ["blue", "red", "yellow"].sample,
    bio: "It\'s not a phase, this is who I am.",
    email: "#{user_name}@email.com",
    birth_date: Faker::Date.birthday(18, 65),
    gender: ["male", "female"].sample
  )
end

Post.destroy_all
User.all.each do |user|
  rand(5..10).times do
    Post.create!(
      title: "What is Lorem Ipsum?",
      content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n" * 20,
      views: rand(0..240),
      user: user
    )
  end
end

Category.destroy_all
20.times do
  Category.create!(name: Faker::Name.title.split()[0])
end

PostCategory.destroy_all
Post.all.each do |post|
  rand(1..5).times do
    PostCategory.create!(post: post, category: Category.all.sample)
  end
end

Like.destroy_all
User.all.each do |user|
  rand(10..20).times do
    Like.create!(user: user, post: Post.all.sample)
  end
end

Comment.destroy_all
Post.all.each do |post|
  rand(5..20).times do
    Comment.create!(
      content: Faker::SiliconValley.quote,
      user: User.all.sample,
      post: post
    )
  end
end
