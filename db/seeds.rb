User.create!(first_name: 'Admin',
             last_name: 'Admin',
             email: 'admin@example.com',
             phone: '0',
             gender: 'None',
             date_of_birth: '1/1/1970',
             admin: true)

User.create(first_name: 'Yaroslav',
            last_name: 'Liakh',
            email: 'liakhyaroslav@gmail.com',
            phone: '+380506456220',
            gender: 'Man',
            date_of_birth: '7/1/1990',
            admin: false)