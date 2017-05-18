User.create!(first_name: 'John',
             last_name: 'Wayne',
             email: 'johnwayne@example.com',
             phone: '+380300000000',
             gender: true,
             birth_date: DateTime.new(1990,7, 1),
             admin: true)

User.create(first_name: 'Diana',
            last_name: 'Prince',
            email: 'dianaprince@example.com',
            phone: '+380300000001',
            gender: false,
            birth_date: DateTime.new(1000,3, 4),
            admin: false)

Apartment.create(room_number: '100',
                 status: 0,
                 price: 200,
                 description: 'Certainly elsewhere my do allowance at. The address farther six hearted hundred
                               towards husband. Are securing off occasion remember daughter replying. Held that
                               feel his see own yet. Strangers ye to he sometimes propriety in. She right plate
                               seven has. Bed who perceive judgment did marianne.',
                 room_type: 0,
                 occupancy: 1)

