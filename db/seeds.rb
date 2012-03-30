# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

require 'time'

#For creating logins
def l(un, pass)
  return Login.create([{ :username => un, :password => pass, :password_confirmation => pass, :owner_type => "Physician" }])[0]
end

def admin(un, pass)
  return Login.create([{ :username => un, :password => pass, :password_confirmation => pass, :owner_type => "Administrator" }])[0]
end

#For creating physicians
def phy(f_nm, m_nm, l_nm, specialty, office_num, login)
  return Physician.create([{ :firstname => f_nm, :middlename => m_nm, :lastname => l_nm, :specialty => specialty, :office_num => office_num, :login => login}])[0]
end

def pat(f_nm, m_nm, l_nm, dob)
  return Patient.create([{ :firstname => f_nm, :middlename => m_nm, :lastname => l_nm, :primary_phy_id => Physician.all[rand(Physician.all.length)].id, :date_of_birth => dob, :pharmacy_id => 1, :insurance_id => 1 }])[0]
end

def apt(start_time, end_time)
  return Appointment.create([{ :start_time => start_time, :end_time => end_time, :phy_id => Physician.all[rand(Physician.all.length)].id, :pat_id => Patient.all[rand(Patient.all.length)].id }])[0]
end

def sch(start_time, end_time)
  return Schedule.create([{ :start_time => start_time, :end_time => end_time, :phy_id => Physician.all[rand(Physician.all.length)].id }])[0]
end

#---------------- Seed data ----------------#

#Create an admin account
admin("root", "password123")

#Create some physician accounts
phy("Kyle", "A", "Kamperschroer", "Nose", 62, l("kyle", "password"))
phy("Ben", "A", "Metzger", "Eyes", 23, l("ben", "password"))
phy("Peter", "A", "Bougie", "Ears", 24, l("peter", "password"))
phy("Zhicheng", "A", "Fu", "Mouth", 61, l("fu", "password"))

#Create some patients
pat("John", "B", "Doe", "23-3-1987")
pat("Steve", "B", "Miller", "12-04-1967")
pat("Phil", "B", "Fons", "30-5-1994")

#Create some appointments
apt(Time.parse("2012/3/12 13:00:00"), Time.parse("2012/3/12 14:45:00"))
apt(Time.parse("2012/3/13 13:00:00"), Time.parse("2012/3/12 14:45:00"))
apt(Time.parse("2012/3/14 13:00:00"), Time.parse("2012/3/12 14:45:00"))
apt(Time.parse("2012/3/15 13:00:00"), Time.parse("2012/3/12 14:45:00"))
apt(Time.parse("2012/3/16 13:00:00"), Time.parse("2012/3/12 14:45:00"))
apt(Time.parse("2012/3/17 13:00:00"), Time.parse("2012/3/12 14:45:00"))
apt(Time.parse("2012/3/18 13:00:00"), Time.parse("2012/3/12 14:45:00"))
apt(Time.parse("2012/3/19 13:00:00"), Time.parse("2012/3/12 14:45:00"))

#Create some schedules
sch(Time.parse("2012/3/12 08:00:00"), Time.parse("2012/3/12 18:00:00"))
sch(Time.parse("2012/3/13 08:00:00"), Time.parse("2012/3/12 18:00:00"))
sch(Time.parse("2012/3/14 08:00:00"), Time.parse("2012/3/12 18:00:00"))
sch(Time.parse("2012/3/15 08:00:00"), Time.parse("2012/3/12 18:00:00"))
sch(Time.parse("2012/3/16 08:00:00"), Time.parse("2012/3/12 18:00:00"))
sch(Time.parse("2012/3/17 08:00:00"), Time.parse("2012/3/12 18:00:00"))
sch(Time.parse("2012/3/18 08:00:00"), Time.parse("2012/3/12 18:00:00"))
