# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Trip.delete_all
# . . .
Trip.create(from_string: 'Los Angeles',
            to_string: 'Santa Barbara',
            date: '2012-11-02',
            time: '17:15',
            flag: 1)

Trip.create(from_string: 'San Luis Obispo',
            to_string: 'Santa Barbara',
            date: '2012-10-31',
            time: '18:30',
            flag: 1)

Trip.create(from_string: 'Thousand Oaks',
            to_string: 'Santa Barbara',
            date: '2012-10-31',
            time: '21:30',
            flag: 1)

Trip.create(from_string: 'San Francisco',
            to_string: 'Santa Barbara',
            date: '2012-11-02',
            time: '23:15',
            flag: 0)

Trip.create(from_string: 'San Diego',
            to_string: 'Santa Barbara',
            date: '2012-11-01',
            time: '15:45',
            flag: 0)

Trip.create(from_string: 'Santa Barbara',
            to_string: 'Los Angeles',
            date: '2012-11-01',
            time: '09:00',
            flag: 1)

Trip.create(from_string: 'San Luis Obispo',
            to_string: 'Los Angeles',
            date: '2012-11-01',
            time: '13:45',
            flag: 0)

Trip.create(from_string: 'Thousand Oaks',
            to_string: 'Los Angeles',
            date: '2012-11-01',
            time: '22:00',
            flag: 0)

Trip.create(from_string: 'San Francisco',
            to_string: 'Los Angeles',
            date: '2012-11-02',
            time: '16:15',
            flag: 0)

Trip.create(from_string: 'San Diego',
            to_string: 'Los Angeles',
            date: '2012-10-31',
            time: '09:45',
            flag: 0)

Trip.create(from_string: 'Santa Barbara',
            to_string: 'San Luis Obispo',
            date: '2012-10-31',
            time: '17:15',
            flag: 1)

Trip.create(from_string: 'Los Angeles',
            to_string: 'San Luis Obispo',
            date: '2012-11-01',
            time: '16:30',
            flag: 1)

Trip.create(from_string: 'Thousand Oaks',
            to_string: 'San Luis Obispo',
            date: '2012-11-01',
            time: '18:45',
            flag: 0)

Trip.create(from_string: 'San Francisco',
            to_string: 'San Luis Obispo',
            date: '2012-11-02',
            time: '22:45',
            flag: 0)

Trip.create(from_string: 'San Diego',
            to_string: 'San Luis Obispo',
            date: '2012-10-30',
            time: '23:30',
            flag: 0)

Trip.create(from_string: 'Santa Barbara',
            to_string: 'Thousand Oaks',
            date: '2012-11-02',
            time: '12:45',
            flag: 0)

Trip.create(from_string: 'Los Angeles',
            to_string: 'Thousand Oaks',
            date: '2012-10-31',
            time: '18:00',
            flag: 1)

Trip.create(from_string: 'San Luis Obispo',
            to_string: 'Thousand Oaks',
            date: '2012-10-30',
            time: '12:00',
            flag: 0)

Trip.create(from_string: 'San Francisco',
            to_string: 'Thousand Oaks',
            date: '2012-11-01',
            time: '23:45',
            flag: 0)

Trip.create(from_string: 'San Diego',
            to_string: 'Thousand Oaks',
            date: '2012-10-30',
            time: '13:45',
            flag: 0)

Trip.create(from_string: 'Santa Barbara',
            to_string: 'San Francisco',
            date: '2012-11-02',
            time: '17:15',
            flag: 0)

Trip.create(from_string: 'Los Angeles',
            to_string: 'San Francisco',
            date: '2012-11-01',
            time: '10:15',
            flag: 1)

Trip.create(from_string: 'San Luis Obispo',
            to_string: 'San Francisco',
            date: '2012-11-01',
            time: '22:30',
            flag: 0)

Trip.create(from_string: 'Thousand Oaks',
            to_string: 'San Francisco',
            date: '2012-11-02',
            time: '08:15',
            flag: 1)

Trip.create(from_string: 'San Diego',
            to_string: 'San Francisco',
            date: '2012-11-01',
            time: '17:00',
            flag: 1)

Trip.create(from_string: 'Santa Barbara',
            to_string: 'San Diego',
            date: '2012-10-30',
            time: '06:15',
            flag: 1)

Trip.create(from_string: 'Los Angeles',
            to_string: 'San Diego',
            date: '2012-10-30',
            time: '14:00',
            flag: 1)

Trip.create(from_string: 'San Luis Obispo',
            to_string: 'San Diego',
            date: '2012-11-01',
            time: '10:00',
            flag: 0)

Trip.create(from_string: 'Thousand Oaks',
            to_string: 'San Diego',
            date: '2012-11-01',
            time: '19:00',
            flag: 0)

Trip.create(from_string: 'San Francisco',
            to_string: 'San Diego',
            date: '2012-11-02',
            time: '21:45',
            flag: 0)

