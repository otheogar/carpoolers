UserLogin.delete_all


UserLogin.create(uid: 'AmbiguousGeek@mail.com',
    password: 'simple',
    email: 'AmbiguousGeek@mail.com')

UserLogin.create(uid: 'SpikyGeek@mail.com',
    password: 'simple',
    email: 'SpikyGeek@mail.com')

UserLogin.create(uid: 'FabulousGeek@mail.com',
    password: 'simple',
    email: 'FabulousGeek@mail.com')

UserLogin.create(uid: 'FlakyGeek@mail.com',
    password: 'simple',
    email: 'FlakyGeek@mail.com')

UserLogin.create(uid: 'ShrillGeek@mail.com',
    password: 'simple',
    email: 'ShrillGeek@mail.com')

UserLogin.create(uid: 'ScaredGeek@mail.com',
    password: 'simple',
    email: 'ScaredGeek@mail.com')

UserLogin.create(uid: 'AlcoholicGeek@mail.com',
    password: 'simple',
    email: 'AlcoholicGeek@mail.com')
	
UserProfile.delete_all

	
UserProfile.create(user_uid: 'SpikyGeek@mail.com',
    name: 'Noreen Fertig',
    email: 'SpikyGeek@mail.com',
    home_string: 'Rochester, NY',
    home_latitude: 43.1555,
    home_longitude: -77.616033)

UserProfile.create(user_uid: 'FabulousGeek@mail.com',
    name: 'Neil Walser',
    email: 'FabulousGeek@mail.com',
    home_string: 'Stamford, CT',
    home_latitude: 41.05182,
    home_longitude: -73.542234)

UserProfile.create(user_uid: 'FlakyGeek@mail.com',
    name: 'Nelson Hilts',
    email: 'FlakyGeek@mail.com',
    home_string: 'Santa Monica, CA',
    home_latitude: 34.011565,
    home_longitude: -118.492289)

UserProfile.create(user_uid: 'ShrillGeek@mail.com',
    name: 'Kurt Beauvais',
    email: 'ShrillGeek@mail.com',
    home_string: 'Lexington, MA',
    home_latitude: 42.446319,
    home_longitude: -71.223751)

UserProfile.create(user_uid: 'ScaredGeek@mail.com',
    name: 'Chandra Taubman',
    email: 'ScaredGeek@mail.com',
    home_string: 'Denver, CO',
    home_latitude: 39.74001,
    home_longitude: -104.992259)

UserProfile.create(user_uid: 'AlcoholicGeek@mail.com',
    name: 'Clayton Schnur',
    email: 'AlcoholicGeek@mail.com',
    home_string: 'Thousand Oaks, CA',
    home_latitude: 34.185,
    home_longitude: -118.894254)

UserProfile.create(user_uid: 'SmilingGeek@mail.com',
    name: 'Dona Westley',
    email: 'SmilingGeek@mail.com',
    home_string: 'Annapolis, VA',
    home_latitude: 38.9767,
    home_longitude: -76.489929)

UserProfile.create(user_uid: 'AnnoyingGeek@mail.com',
    name: 'Amie Quint',
    email: 'AnnoyingGeek@mail.com',
    home_string: 'Cambridge, MA',
    home_latitude: 42.36679,
    home_longitude: -71.106019)

UserProfile.create(user_uid: 'UttermostGeek@mail.com',
    name: 'Hillary Murtagh',
    email: 'UttermostGeek@mail.com',
    home_string: 'Norwalk, CT',
    home_latitude: 41.11366,
    home_longitude: -73.407654)

UserProfile.create(user_uid: 'GlamorousGeek@mail.com',
    name: 'Clare Racicot',
    email: 'GlamorousGeek@mail.com',
    home_string: 'Richmond, VA',
    home_latitude: 37.5407,
    home_longitude: -77.433654)

UserProfile.create(user_uid: 'DirtyGeek@mail.com',
    name: 'Clayton Heldt',
    email: 'DirtyGeek@mail.com',
    home_string: 'Norwalk, CT',
    home_latitude: 41.11366,
    home_longitude: -73.407654)

UserProfile.create(user_uid: 'DangerousGeek@mail.com',
    name: 'Alana Carolina',
    email: 'DangerousGeek@mail.com',
    home_string: 'Newport Beach, CA',
    home_latitude: 33.616835,
    home_longitude: -117.930343)

UserProfile.create(user_uid: 'ReconditeGeek@mail.com',
    name: 'Clayton Autin',
    email: 'ReconditeGeek@mail.com',
    home_string: 'Newport Beach, CA',
    home_latitude: 33.616835,
    home_longitude: -117.930343)

UserProfile.create(user_uid: 'AttractiveGeek@mail.com',
    name: 'Tameka Segars',
    email: 'AttractiveGeek@mail.com',
    home_string: 'Springfield, MA',
    home_latitude: 42.10125,
    home_longitude: -72.589294)

UserProfile.create(user_uid: 'DynamicGeek@mail.com',
    name: 'Hugh Loss',
    email: 'DynamicGeek@mail.com',
    home_string: 'Detroit, MI',
    home_latitude: 42.331685,
    home_longitude: -83.047924)
	
	
Trip.delete_all

Trip.create(from_string: 'Chicago,IL',
    to_string: 'Rochester, NY',
    from_latitude: 41.88415,
    from_longitude: -87.632409,
    to_latitude: 43.1555,
    to_longitude: -77.616033,
    date: '2012-11-13',
    time: '08:45',
    flag: 0,
    owner_id: 'AttractiveGeek@mail.com')

Trip.create(from_string: 'Chicago,IL',
    to_string: 'Rochester, NY',
    from_latitude: 41.88415,
    from_longitude: -87.632409,
    to_latitude: 43.1555,
    to_longitude: -77.616033,
    date: '2012-11-19',
    time: '18:00',
    flag: 1,
    owner_id: 'AnnoyingGeek@mail.com')

Trip.create(from_string: 'Chicago,IL',
    to_string: 'Detroit, MI',
    from_latitude: 41.88415,
    from_longitude: -87.632409,
    to_latitude: 42.331685,
    to_longitude: -83.047924,
    date: '2012-11-20',
    time: '15:45',
    flag: 0,
    owner_id: 'GlamorousGeek@mail.com')

Trip.create(from_string: 'Chicago,IL',
    to_string: 'Detroit, MI',
    from_latitude: 41.88415,
    from_longitude: -87.632409,
    to_latitude: 42.331685,
    to_longitude: -83.047924,
    date: '2012-11-22',
    time: '23:45',
    flag: 1,
    owner_id: 'ReconditeGeek@mail.com')

Trip.create(from_string: 'Chicago,IL',
    to_string: 'Ann Arbor, MI',
    from_latitude: 41.88415,
    from_longitude: -87.632409,
    to_latitude: 42.281875,
    to_longitude: -83.748479,
    date: '2012-11-18',
    time: '22:00',
    flag: 0,
    owner_id: 'DynamicGeek@mail.com')

Trip.create(from_string: 'Chicago,IL',
    to_string: 'Ann Arbor, MI',
    from_latitude: 41.88415,
    from_longitude: -87.632409,
    to_latitude: 42.281875,
    to_longitude: -83.748479,
    date: '2012-11-18',
    time: '05:15',
    flag: 1,
    owner_id: 'DirtyGeek@mail.com')

Trip.create(from_string: 'Chicago,IL',
    to_string: 'Tampa, FL',
    from_latitude: 41.88415,
    from_longitude: -87.632409,
    to_latitude: 27.94653,
    to_longitude: -82.459269,
    date: '2012-11-18',
    time: '19:15',
    flag: 0,
    owner_id: 'EndurableGeek@mail.com')

Trip.create(from_string: 'Chicago,IL',
    to_string: 'Tampa, FL',
    from_latitude: 41.88415,
    from_longitude: -87.632409,
    to_latitude: 27.94653,
    to_longitude: -82.459269,
    date: '2012-11-20',
    time: '22:15',
    flag: 1,
    owner_id: 'BeautifulDancer@mail.com')

Trip.create(from_string: 'Chicago,IL',
    to_string: 'Washington, DC',
    from_latitude: 41.88415,
    from_longitude: -87.632409,
    to_latitude: 38.89037,
    to_longitude: -77.031959,
    date: '2012-11-22',
    time: '23:45',
    flag: 0,
    owner_id: 'ShrillGeek@mail.com')

Trip.create(from_string: 'Chicago,IL',
    to_string: 'Washington, DC',
    from_latitude: 41.88415,
    from_longitude: -87.632409,
    to_latitude: 38.89037,
    to_longitude: -77.031959,
    date: '2012-11-30',
    time: '21:30',
    flag: 1,
    owner_id: 'AmbiguousGeek@mail.com')

Trip.create(from_string: 'Chicago,IL',
    to_string: 'Baltimore, MD',
    from_latitude: 41.88415,
    from_longitude: -87.632409,
    to_latitude: 39.290585,
    to_longitude: -76.609264,
    date: '2012-11-23',
    time: '17:45',
    flag: 0,
    owner_id: 'AlcoholicGeek@mail.com')

Trip.create(from_string: 'Chicago,IL',
    to_string: 'Baltimore, MD',
    from_latitude: 41.88415,
    from_longitude: -87.632409,
    to_latitude: 39.290585,
    to_longitude: -76.609264,
    date: '2012-11-12',
    time: '05:30',
    flag: 1,
    owner_id: 'DynamicGeek@mail.com')

Trip.create(from_string: 'Chicago,IL',
    to_string: 'Denver, CO',
    from_latitude: 41.88415,
    from_longitude: -87.632409,
    to_latitude: 39.74001,
    to_longitude: -104.992259,
    date: '2012-11-22',
    time: '16:15',
    flag: 0,
    owner_id: 'EndurableGeek@mail.com')

Trip.create(from_string: 'Chicago,IL',
    to_string: 'Denver, CO',
    from_latitude: 41.88415,
    from_longitude: -87.632409,
    to_latitude: 39.74001,
    to_longitude: -104.992259,
    date: '2012-11-20',
    time: '11:00',
    flag: 1,
    owner_id: 'FlakyGeek@mail.com')

Trip.create(from_string: 'Chicago,IL',
    to_string: 'Philadelphia, PA',
    from_latitude: 41.88415,
    from_longitude: -87.632409,
    to_latitude: 39.95228,
    to_longitude: -75.162454,
    date: '2012-11-17',
    time: '12:15',
    flag: 0,
    owner_id: 'DangerousGeek@mail.com')

Trip.create(from_string: 'Chicago,IL',
    to_string: 'Philadelphia, PA',
    from_latitude: 41.88415,
    from_longitude: -87.632409,
    to_latitude: 39.95228,
    to_longitude: -75.162454,
    date: '2012-11-17',
    time: '18:30',
    flag: 1,
    owner_id: 'DangerousGeek@mail.com')

Trip.create(from_string: 'Chicago,IL',
    to_string: 'Pittsburgh, PA',
    from_latitude: 41.88415,
    from_longitude: -87.632409,
    to_latitude: 40.438335,
    to_longitude: -79.997459,
    date: '2012-11-18',
    time: '19:15',
    flag: 0,
    owner_id: 'ReconditeGeek@mail.com')

Trip.create(from_string: 'Chicago,IL',
    to_string: 'Pittsburgh, PA',
    from_latitude: 41.88415,
    from_longitude: -87.632409,
    to_latitude: 40.438335,
    to_longitude: -79.997459,
    date: '2012-11-17',
    time: '13:15',
    flag: 1,
    owner_id: 'HappyDancer@mail.com')

Trip.create(from_string: 'Chicago,IL',
    to_string: 'Newark, NJ',
    from_latitude: 41.88415,
    from_longitude: -87.632409,
    to_latitude: 40.73197,
    to_longitude: -74.174184,
    date: '2012-11-17',
    time: '09:30',
    flag: 0,
    owner_id: 'CrazyDancer@mail.com')