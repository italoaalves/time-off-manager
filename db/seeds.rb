employee = User.create!(
  name: 'Jonh Doe',
  email: 'jonhd@acme.com',
  position: 'Software Engineer',
  password: 'password',
  role: 0,
  starting_date: 2.years.ago,
  is_on_vacation: false
)

User.create!(
  name: 'Jane Doe',
  email: 'janed@acme.com',
  position: 'Manager',
  password: 'password',
  role: 1,
  starting_date: 3.years.ago,
  is_on_vacation: false
)

Vacation.create!(year: '2023', user: employee, balance: 30, expires_at: 1.year.after)
vac = Vacation.create!(year: '2022', user: employee, balance: 30,
                       expires_at: employee.starting_date.change(year: Date.today.year.to_i))

off = vac.off_times.build(starts_at: Date.tomorrow - 6.months - 23.days, ends_at: Date.today - 6.months)
off.user = employee
if off.save(validate: false)
  vac.withdraw(off.days_count)
  vac.save
else
  puts off.errors.messages
end

puts <<~WARN

  ---------------------------------------------------------------

    PLEASE CHECK THE seeds.rb FILE for USER SIGN IN INFO.

  ---------------------------------------------------------------
WARN
