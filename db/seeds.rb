# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
employee = User.create!(
    name: "Jonh Doe",
    email: "jonhd@acme.com",
    position: "Software Engineer",
    password: "password",
    role: 0,
    starting_date: 2.years.ago,
    is_on_vacation: false
)

User.create!(
    name: "Jane Doe",
    email: "janed@acme.com",
    position: "Manager",
    password: "password",
    role: 1,
    starting_date: 3.years.ago,
    is_on_vacation: false
)

Vacation.create!(year: "2023", user: employee, balance: 30, expires_at: 1.year.after)
vac = Vacation.create!(year: "2022", user: employee, balance: 30, expires_at: Date.today - 1.day)

OffTime.create!(vacation: vac, user_id: vac.user.id, starts_at: Date.today - 6.months, ends_at: Date.today - 5.months)
