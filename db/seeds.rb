# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
users = User.create([
                      { login: 'Hanna4007', phone_number: '+380661234000', password: '12345678',
                        admin: true },
                      { login: 'Oleksiy', phone_number: '+380661234001', password: '12345678',
                        admin: false },
                      { login: 'Mariya', phone_number: '+380661234002', password: '12345678', admin: false },
                      { login: 'Ivan', phone_number: '+380661234003', password: '12345678', admin: false },
                      { login: 'Olena', phone_number: '+380661234004', password: '12345678', admin: false },
                      { login: 'Taras', phone_number: '+380661234005', password: '12345678', admin: false },
                      { login: 'Iryna', phone_number: '+380661234006', password: '12345678', admin: false },
                      { login: 'Mykola', phone_number: '+380661234007', password: '12345678', admin: false },
                      { login: 'Svitlana', phone_number: '+380661234008', password: '12345678',
                        admin: false },
                      { login: 'Yuriy', phone_number: '+380661234009', password: '12345678', admin: false },
                      { login: 'Anna', phone_number: '+380661234010', password: '12345678', admin: false }
                    ])

channels = Channel.create([
                            { name: 'France' },
                            { name: 'Italy' },
                            { name: 'Spain' },
                            { name: 'Germany' },
                            { name: 'USA' },
                            { name: 'Canada' },
                            { name: 'Australia' },
                            { name: 'Japan' },
                            { name: 'China' },
                            { name: 'Brazil' },
                            { name: 'India' },
                            { name: 'Mexico' },
                            { name: 'Norway' },
                            { name: 'Finland' },
                            { name: 'Denmark' },
                            { name: 'Sweden' }
                          ])

users.each do |user|
  selected_channels = channels.sample(5)
  selected_channels.each do |channel|
    Membership.create(user_id: user.id, channel_id: channel.id)
  end
end

france_channel = Channel.find_by(name: 'France')
user_for_france_channel = france_channel.users.pluck(:id)
messages_for_france = [
  "Have you visited the Eiffel Tower in Paris? It's a must-see landmark!",
  "The Louvre Museum in Paris is amazing! It's home to the Mona Lisa.",
  'I recommend visiting the French Riviera. Beautiful beaches and stunning scenery.',
  "Don't miss the Château de Chambord. It's a fantastic example of French Renaissance architecture.",
  'The wine regions in Bordeaux are fantastic for wine lovers. Many vineyards and wineries to explore.',
  'Mont Saint-Michel is a magical island commune in Normandy, definitely worth a visit.',
  'Provence is known for its beautiful lavender fields and charming villages.',
  'Alsace is great for its picturesque towns and unique blend of French and German cultures.',
  'The Palace of Versailles is an extravagant symbol of French royalty and history.',
  'Try authentic French cuisine in Lyon, which is known as the culinary capital of France.',
  'The beaches of Normandy have stunning landscapes and historical significance from World War II.',
  'Take a stroll along the Seine River in Paris for a romantic and scenic experience.',
  'Explore the beautiful Loire Valley châteaux, each with its own history and charm.',
  'Corsica offers incredible natural beauty with mountains and beaches that are perfect for hiking and relaxation.',
  'The city of Lille has a rich history and beautiful architecture, along with great museums and eateries.'
]

messages_for_france.each do |message|
  user_id = user_for_france_channel.sample
  Message.create(channel_id: france_channel.id, body: message, user_id:)
end

italy_channel = Channel.find_by(name: 'Italy')
user_for_italy_channel = italy_channel.users.pluck(:id)
messages_for_italy = [
  "Have you visited the Colosseum in Rome? It's a magnificent ancient amphitheater!",
  'Venice is a must-see with its beautiful canals and historic architecture.',
  'Florence is known for its stunning Renaissance art and architecture.',
  'The Amalfi Coast offers breathtaking views and charming coastal towns.',
  "Rome's Vatican City is home to the Sistine Chapel and St. Peter's Basilica.",
  'Try authentic Italian pizza in Naples, where it all began!',
  'Milan is famous for its fashion scene and the impressive Milan Cathedral.',
  "Tuscany's rolling hills and vineyards make it perfect for wine enthusiasts.",
  'The ruins of Pompeii offer a fascinating glimpse into ancient Roman life.',
  'Sicily boasts beautiful beaches and historical sites like the Valley of the Temples.',
  'The Cinque Terre is a picturesque coastal area with colorful cliffside villages.',
  'Pisa is home to the iconic Leaning Tower and a beautiful cathedral.',
  "Genoa's historic port and architecture are worth exploring.",
  'Bologna is renowned for its rich culinary traditions and medieval architecture.',
  'The island of Capri is famous for its stunning scenery and luxury resorts.'
]

messages_for_italy.each do |message|
  user_id = user_for_italy_channel.sample
  Message.create(channel_id: italy_channel.id, body: message, user_id:)
end

spain_channel = Channel.find_by(name: 'Spain')
user_for_spain_channel = spain_channel.users.pluck(:id)
messages_for_spain = [
  "Have you explored Barcelona's iconic Sagrada Familia? It's a masterpiece by Gaudí.",
  "Madrid's Prado Museum houses an impressive collection of European art.",
  'Seville is famous for its beautiful Alcázar palace and vibrant flamenco culture.',
  'The beaches of Costa del Sol are perfect for a relaxing seaside vacation.',
  "Granada's Alhambra is a stunning example of Moorish architecture and history.",
  'Valencia is known for its futuristic City of Arts and Sciences.',
  'San Sebastián offers amazing culinary experiences and beautiful beaches.',
  'The island of Mallorca is great for both relaxing on beaches and exploring charming villages.',
  'Bilbao is home to the Guggenheim Museum and is a must-visit for modern art lovers.',
  'Toledo is a historic city with beautiful medieval architecture and rich history.',
  'The Pyrenees mountains offer excellent opportunities for hiking and nature activities.',
  'Santiago de Compostela is famous for its cathedral and as the endpoint of the Camino de Santiago pilgrimage.',
  'The Canary Islands boast unique volcanic landscapes and beautiful beaches.',
  'La Rioja is renowned for its wine production and picturesque vineyards.',
  'Salamanca is known for its ancient university and stunning architecture.'
]

messages_for_spain.each do |message|
  user_id = user_for_spain_channel.sample
  Message.create(channel_id: spain_channel.id, body: message, user_id:)
end

germany_channel = Channel.find_by(name: 'Germany')
user_for_germany_channel = germany_channel.users.pluck(:id)
messages_for_germany = [
  "Berlin's Brandenburg Gate is a must-see landmark with a rich history.",
  'The Neuschwanstein Castle in Bavaria looks like a fairy tale castle.',
  "Munich's Oktoberfest is the world's largest beer festival and a fantastic experience.",
  'The Black Forest region offers beautiful hiking trails and scenic landscapes.',
  "Hamburg's Miniatur Wunderland is the world's largest model railway exhibition.",
  'The Rhine Valley is famous for its picturesque castles and vineyards.',
  "Dresden's Frauenkirche is a stunning example of baroque architecture.",
  'The Cologne Cathedral is a UNESCO World Heritage site and an architectural masterpiece.',
  "Heidelberg is home to Germany's oldest university and a beautiful castle.",
  'Rothenburg ob der Tauber is a well-preserved medieval town worth visiting.',
  "The Zugspitze is Germany's highest peak and offers breathtaking views.",
  'Leipzig is known for its vibrant arts and music scene.',
  "Bremen's old town is charming with its medieval buildings and narrow streets.",
  "Frankfurt's skyline is impressive, and the city is a major financial hub.",
  'Nuremberg is famous for its historical sites and delicious gingerbread.'
]

messages_for_germany.each do |message|
  user_id = user_for_germany_channel.sample
  Message.create(channel_id: germany_channel.id, body: message, user_id:)
end

usa_channel = Channel.find_by(name: 'USA')
user_for_usa_channel = usa_channel.users.pluck(:id)
messages_for_usa = [
  'The Grand Canyon in Arizona is a breathtaking natural wonder.',
  'Times Square in New York City is a vibrant and bustling tourist spot.',
  'Yellowstone National Park is known for its geysers, hot springs, and wildlife.',
  'The Golden Gate Bridge in San Francisco offers stunning views.',
  'Las Vegas Strip is famous for its casinos, entertainment, and nightlife.',
  'The Statue of Liberty in New York City is an iconic symbol of freedom.',
  'The White House in Washington, D.C. is the official residence of the President of the USA.',
  'Disney World in Orlando, Florida is a magical destination for families.',
  'Niagara Falls, on the border of New York and Canada, is a spectacular natural attraction.',
  'The Hollywood Walk of Fame in Los Angeles celebrates entertainment industry stars.',
  'The Great Smoky Mountains National Park offers beautiful scenery and diverse wildlife.',
  'Alcatraz Island in San Francisco Bay is a historic site with a former prison.',
  'The Smithsonian Museums in Washington, D.C. offer a wealth of knowledge and exhibits.',
  'The beaches of Hawaii provide a tropical paradise with stunning landscapes.',
  'Mount Rushmore in South Dakota features the carved faces of four US presidents.'
]

messages_for_usa.each do |message|
  user_id = user_for_usa_channel.sample
  Message.create(channel_id: usa_channel.id, body: message, user_id:)
end

canada_channel = Channel.find_by(name: 'Canada')
user_for_canada_channel = canada_channel.users.pluck(:id)
messages_for_canada = [
  'Niagara Falls is a must-see natural wonder located on the border of Ontario and New York.',
  'Banff National Park in Alberta offers stunning mountain views and outdoor activities.',
  'The CN Tower in Toronto provides breathtaking views of the city and Lake Ontario.',
  'Old Quebec is a historic district with charming cobblestone streets and beautiful architecture.',
  'The Rocky Mountaineer train offers a scenic journey through the Canadian Rockies.',
  'Stanley Park in Vancouver is a great place for outdoor activities and enjoying nature.',
  'Prince Edward Island is known for its beautiful beaches and picturesque landscapes.',
  'The Cabot Trail in Nova Scotia offers spectacular coastal views and hiking opportunities.',
  'The Montreal Botanical Garden is a beautiful place to explore a variety of plant species.',
  'The Calgary Stampede is a famous annual rodeo and festival held in Calgary, Alberta.',
  'The Northern Lights can be seen in many parts of Canada, especially in the northern regions.',
  'The Bay of Fundy in New Brunswick is known for having the highest tides in the world.',
  'The Parliament Hill in Ottawa is the political and cultural heart of Canada.',
  'Whistler is a popular ski resort town in British Columbia known for its winter sports.',
  'The Royal Ontario Museum in Toronto has an extensive collection of art, culture, and nature exhibits.'
]
messages_for_canada.each do |message|
  user_id = user_for_canada_channel.sample
  Message.create(channel_id: canada_channel.id, body: message, user_id:)
end

australia_channel = Channel.find_by(name: 'Australia')
user_for_australia_channel = australia_channel.users.pluck(:id)
messages_for_australia = [
  'The Great Barrier Reef is a spectacular natural wonder with stunning coral reefs and marine life.',
  'Sydney Opera House is an iconic landmark with incredible architecture and cultural performances.',
  'Uluru (Ayers Rock) in the Northern Territory is a sacred site with deep cultural significance.',
  'The Twelve Apostles along the Great Ocean Road in Victoria offer breathtaking coastal views.',
  'The Daintree Rainforest in Queensland is one of the oldest rainforests in the world.',
  'The Sydney Harbour Bridge provides an amazing view of the city and harbour.',
  'Kakadu National Park in the Northern Territory is known for its diverse wildlife and Aboriginal rock art.',
  'The Whitsunday Islands are perfect for sailing and relaxing on pristine beaches.',
  'Tasmania offers beautiful landscapes, hiking trails, and unique wildlife.',
  'The Great Ocean Road drive is famous for its scenic coastal views and limestone formations.',
  "Fraser Island in Queensland is the world's largest sand island with beautiful lakes and beaches.",
  'The Blue Mountains near Sydney offer stunning scenery and excellent hiking opportunities.',
  'The Gold Coast is famous for its beaches, surfing spots, and vibrant nightlife.',
  'Melbourne is known for its cultural diversity, coffee culture, and arts scene.',
  'The Outback offers unique desert landscapes, wildlife, and cultural experiences.'
]

messages_for_australia.each do |message|
  user_id = user_for_australia_channel.sample
  Message.create(channel_id: australia_channel.id, body: message, user_id:)
end

japan_channel = Channel.find_by(name: 'Japan')
user_for_japan_channel = japan_channel.users.pluck(:id)
messages_for_japan = [
  'Mount Fuji is an iconic symbol of Japan and offers breathtaking views and hiking opportunities.',
  'The historic city of Kyoto is known for its beautiful temples, gardens, and traditional tea houses.',
  'Tokyo is a bustling metropolis with a mix of modern skyscrapers, historic temples, and vibrant neighborhoods.',
  'The cherry blossoms in spring are a must-see, with parks like Ueno and Shinjuku Gyoen in Tokyo offering stunning views.',
  'The Hiroshima Peace Memorial Park is a poignant reminder of history and a symbol of peace.',
  'Osaka is famous for its street food, vibrant nightlife, and the impressive Osaka Castle.',
  'Nara is home to friendly deer and ancient temples, including the famous Todai-ji Temple.',
  'The hot springs (onsen) in Hakone provide a relaxing experience with beautiful views of Mount Fuji.',
  'Hokkaido is known for its beautiful landscapes, skiing resorts, and fresh seafood.',
  'The island of Okinawa offers stunning beaches, crystal-clear waters, and unique Ryukyu culture.',
  'The historic village of Shirakawa-go is known for its traditional thatched-roof houses.',
  'The city of Fukuoka is famous for its delicious ramen and lively festivals.',
  'Nagano is a great destination for winter sports and is home to the historic Zenko-ji Temple.',
  'The bamboo groves of Arashiyama in Kyoto provide a serene and picturesque experience.',
  'The neon lights and bustling streets of Shibuya in Tokyo are a must-see, especially the famous Shibuya Crossing.'
]

messages_for_japan.each do |message|
  user_id = user_for_japan_channel.sample
  Message.create(channel_id: japan_channel.id, body: message, user_id:)
end

china_channel = Channel.find_by(name: 'China')
user_for_china_channel = china_channel.users.pluck(:id)
messages_for_china = [
  'The Great Wall of China is an iconic landmark stretching across northern China with breathtaking views.',
  'The Forbidden City in Beijing is a massive palace complex with rich history and stunning architecture.',
  "The Terracotta Army in Xi'an is an impressive collection of terracotta sculptures depicting the armies of the first Emperor of China.",
  'The Li River in Guilin offers beautiful scenery with its unique karst mountains and picturesque river views.',
  'Shanghai is a modern metropolis known for its skyline, historical sites, and vibrant culture.',
  'The Yellow Mountains (Huangshan) are famous for their stunning scenery, sunrise views, and unique granite peaks.',
  'The Potala Palace in Lhasa, Tibet, is a UNESCO World Heritage Site and an iconic symbol of Tibetan Buddhism.',
  'The Yangtze River Cruise offers an opportunity to see the stunning Three Gorges and various historical sites along the river.',
  "Zhangjiajie National Forest Park is known for its towering sandstone pillars, which inspired the floating mountains in the movie 'Avatar'.",
  'The ancient town of Lijiang offers a glimpse into traditional Chinese architecture and culture with its well-preserved old town.',
  'The city of Hangzhou is famous for its scenic West Lake and beautiful gardens.',
  'Chengdu is known for its giant pandas and the Chengdu Research Base of Giant Panda Breeding.',
  'The Longmen Grottoes in Luoyang are a collection of thousands of Buddhist statues carved into cliffs.',
  'The city of Suzhou is renowned for its classical Chinese gardens and historic water towns.',
  'The Jiuzhaigou Valley is a national park with stunning multi-colored lakes, waterfalls, and snow-capped peaks.'
]

messages_for_china.each do |message|
  user_id = user_for_china_channel.sample
  Message.create(channel_id: china_channel.id, user_id:, body: message)
end

brazil_channel = Channel.find_by(name: 'Brazil')
user_for_brazil_channel = brazil_channel.users.pluck(:id)
messages_for_brazil = [
  "Have you visited the Christ the Redeemer statue in Rio de Janeiro? It's a must-see!",
  'The Amazon Rainforest is an incredible destination for nature lovers and adventurers.',
  'Iguazu Falls, located on the border with Argentina, is one of the most stunning waterfalls in the world.',
  'The beaches of Copacabana and Ipanema in Rio are famous for their beauty and vibrant atmosphere.',
  'The city of Salvador is known for its Afro-Brazilian culture and historic Pelourinho district.',
  "The Pantanal is the world's largest tropical wetland and is great for wildlife watching.",
  'The Amazon River is the second-longest river in the world and offers amazing boat tours.',
  'The city of São Paulo is a cultural hub with incredible museums, restaurants, and nightlife.',
  'The historic town of Ouro Preto is famous for its colonial architecture and rich history.',
  'Chapada Diamantina National Park is a breathtaking area for hiking and exploring caves and waterfalls.',
  'The Carnival in Rio de Janeiro is one of the biggest and most famous festivals in the world.',
  'The city of Recife has beautiful beaches and a vibrant arts scene.',
  'Fernando de Noronha is an archipelago with stunning beaches and excellent diving spots.',
  'The city of Belo Horizonte is known for its culinary delights and modern architecture.',
  'The Lençóis Maranhenses National Park features stunning sand dunes and seasonal lagoons.'
]

messages_for_brazil.each do |message|
  user_id = user_for_brazil_channel.sample
  Message.create(channel_id: brazil_channel.id, body: message, user_id:)
end

india_channel = Channel.find_by(name: 'India')
user_for_india_channel = india_channel.users.pluck(:id)
messages_for_india = [
  "Have you explored the Taj Mahal in Agra? It's one of the Seven Wonders of the World!",
  'The backwaters of Kerala offer a unique and relaxing experience with beautiful houseboat tours.',
  'Varanasi is one of the oldest cities in the world, known for its spiritual significance and ghats.',
  'The beaches of Goa are famous for their vibrant nightlife and beautiful coastal scenery.',
  'Jaipur, the Pink City, is renowned for its stunning palaces and historic forts.',
  "Mumbai, India's financial capital, has a rich blend of colonial architecture and bustling markets.",
  'Rajasthan is known for its majestic forts, palaces, and desert landscapes.',
  'The holy city of Amritsar is home to the Golden Temple, an important pilgrimage site for Sikhs.',
  'Udaipur, also known as the City of Lakes, offers picturesque views and beautiful palaces.',
  'The Valley of Flowers National Park in Uttarakhand is famous for its diverse and colorful flora.',
  'Delhi, the capital city, has a mix of historical landmarks and modern attractions.',
  "Goa's Dudhsagar Waterfalls are a stunning sight and a great place for adventure enthusiasts.",
  'The Andaman and Nicobar Islands offer pristine beaches and excellent snorkeling opportunities.',
  'Rishikesh is known as the Yoga Capital of the World and offers serene surroundings for meditation.',
  'The city of Hyderabad is famous for its rich history, including the Charminar and Golconda Fort.'
]

messages_for_india.each do |message|
  user_id = user_for_india_channel.sample
  Message.create(channel_id: india_channel.id, body: message, user_id:)
end

mexico_channel = Channel.find_by(name: 'Mexico')
user_for_mexico_channel = mexico_channel.users.pluck(:id)
messages_for_mexico = [
  "Have you visited the Chichen Itza ruins? It's a must-see ancient Mayan city!",
  'The beaches of Cancun are famous for their turquoise waters and vibrant nightlife.',
  'Mexico City offers a rich cultural experience with its historic sites and museums.',
  'The town of San Miguel de Allende is known for its charming streets and colonial architecture.',
  'The Yucatán Peninsula is home to stunning cenotes, perfect for swimming and diving.',
  'The city of Guadalajara is renowned for its traditional Mexican cuisine and lively culture.',
  'Tulum is famous for its well-preserved Mayan ruins and beautiful beachside location.',
  'The Copper Canyon in northern Mexico offers breathtaking views and excellent hiking opportunities.',
  'The historic center of Oaxaca is known for its vibrant markets and delicious local cuisine.',
  'The Baja Peninsula offers stunning landscapes and excellent opportunities for whale watching.',
  'The city of Monterrey is a modern metropolis with beautiful parks and cultural attractions.',
  'Puerto Vallarta is known for its picturesque beaches and lively waterfront boardwalk.',
  'La Paz in Baja California Sur offers great opportunities for snorkeling and kayaking.',
  'The Pueblos Mágicos (Magical Towns) throughout Mexico offer unique cultural experiences.',
  'The town of Valle de Bravo is a charming destination with beautiful lakes and outdoor activities.'
]

messages_for_mexico.each do |message|
  user_id = user_for_mexico_channel.sample
  Message.create(channel_id: mexico_channel.id, body: message, user_id:)
end

norway_channel = Channel.find_by(name: 'Norway')
user_for_norway_channel = norway_channel.users.pluck(:id)
messages_for_norway = [
  'Have you visited the stunning fjords of Norway? They offer breathtaking views!',
  'The city of Oslo has fantastic museums and a vibrant cultural scene.',
  'The Northern Lights are a must-see phenomenon, best viewed from Tromsø or the Lofoten Islands.',
  'The Geirangerfjord and Nærøyfjord are UNESCO World Heritage sites with spectacular natural beauty.',
  'The town of Bergen is known for its picturesque old wharf, Bryggen, and its gateway to the fjords.',
  "Norway's coastline features some of the most beautiful and remote islands, perfect for exploration.",
  'The scenic Flåm Railway offers one of the most beautiful train journeys in the world.',
  'The Svalbard archipelago is a unique destination with incredible wildlife and Arctic landscapes.',
  'Rondane National Park offers great opportunities for hiking and enjoying nature.',
  'The historic town of Lillehammer is known for its winter sports facilities and charming atmosphere.',
  'The city of Stavanger is famous for its stunning landscapes and the nearby Pulpit Rock.',
  'Explore the beautiful coastal town of Ålesund with its unique Art Nouveau architecture.',
  'The Hardangervidda plateau is the largest national park in Norway, ideal for hiking and nature watching.',
  'Visit the historic Nidaros Cathedral in Trondheim, an impressive example of medieval architecture.',
  'The Atlantic Road offers a scenic drive with stunning views of the Norwegian Sea and coastal islands.'
]

messages_for_norway.each do |message|
  user_id = user_for_norway_channel.sample
  Message.create(channel_id: norway_channel.id, body: message, user_id:)
end

finland_channel = Channel.find_by(name: 'Finland')
user_for_finland_channel = finland_channel.users.pluck(:id)
messages_for_finland = [
  'Have you experienced the magical Northern Lights in Finnish Lapland?',
  'Helsinki offers a unique blend of modern and historical architecture.',
  'Rovaniemi, the capital of Lapland, is known as the home of Santa Claus.',
  'Explore the stunning lakes and forests of the Finnish countryside.',
  'The sauna is an essential part of Finnish culture. Have you tried it?',
  'Visit the beautiful city of Turku, known for its rich history and charming atmosphere.',
  'The archipelago around Åland is perfect for sailing and nature enthusiasts.',
  'Lapland offers incredible opportunities for winter sports and adventure.',
  'The city of Tampere is known for its vibrant cultural scene and beautiful lakes.',
  'Enjoy the unique design and architecture in the city of Oulu.',
  'The traditional Finnish wooden houses and peaceful countryside are perfect for a relaxing getaway.',
  'Experience the tranquility of Finnish nature in the national parks, like Koli or Nuuksio.',
  'The city of Jyväskylä offers a mix of nature, culture, and modern amenities.',
  'Explore the historic Fortress of Suomenlinna, a UNESCO World Heritage site near Helsinki.',
  'The Finnish Lakeland region is known for its picturesque lakes and charming small towns.'
]

messages_for_finland.each do |message|
  user_id = user_for_finland_channel.sample
  Message.create(channel_id: finland_channel.id, body: message, user_id:)
end

denmark_channel = Channel.find_by(name: 'Denmark')
user_for_denmark_channel = denmark_channel.users.pluck(:id)
messages_for_denmark = [
  "Have you visited Copenhagen's iconic Tivoli Gardens? It's a must-see attraction!",
  'The Little Mermaid statue in Copenhagen is a famous symbol of Danish culture.',
  'Explore the picturesque streets of Nyhavn in Copenhagen, lined with colorful buildings.',
  'Roskilde is known for its historic cathedral and Viking Ship Museum.',
  'The Danish countryside offers beautiful landscapes and charming small towns.',
  'Enjoy the stunning views from the top of the Round Tower in Copenhagen.',
  'Visit the historic Frederiksborg Castle, known for its Renaissance architecture.',
  'The city of Aarhus is known for its vibrant cultural scene and modern architecture.',
  'Discover the beautiful beaches and scenic nature of Bornholm Island.',
  'The Louisiana Museum of Modern Art offers impressive exhibitions and beautiful coastal views.',
  'Experience Danish hygge in a cozy café or during a relaxing evening at home.',
  'Explore the unique architecture of the city of Aalborg, known for its modern buildings and historic charm.',
  'The city of Odense, the birthplace of Hans Christian Andersen, offers a charming experience with fairy-tale attractions.',
  'The Mols Bjerge National Park is a great place for hiking and exploring Danish nature.',
  'Try traditional Danish pastries, like Danish rye bread and cinnamon rolls, during your visit.'
]

messages_for_denmark.each do |message|
  user_id = user_for_denmark_channel.sample
  Message.create(channel_id: denmark_channel.id, body: message, user_id:)
end

sweden_channel = Channel.find_by(name: 'Sweden')
user_for_sweden_channel = sweden_channel.users.pluck(:id)
messages_for_sweden = [
  "Stockholm's Gamla Stan is a beautiful and historic area with charming streets.",
  'Visit the Vasa Museum in Stockholm to see the impressive 17th-century warship.',
  'The Northern Lights can be seen in Swedish Lapland during the winter months.',
  'Explore the stunning archipelago of Stockholm, with its numerous islands and scenic beauty.',
  "Uppsala is home to one of Sweden's oldest universities and a beautiful cathedral.",
  'The Icehotel in Jukkasjärvi offers a unique experience with rooms made entirely of ice and snow.',
  "Sweden's countryside features beautiful lakes, forests, and picturesque villages.",
  'The Abisko National Park is a great place for outdoor activities, including hiking and skiing.',
  'Gothenburg is known for its canals and excellent seafood restaurants.',
  'The island of Gotland has a rich history and beautiful medieval architecture.',
  'Visit the picturesque town of Visby on Gotland, which is a UNESCO World Heritage site.',
  'Sweden is famous for its fika culture a coffee break enjoyed with pastries and conversation.',
  'Explore the beautiful beaches of Öland, a popular destination during the summer months.',
  'The town of Kalmar has a historic castle and beautiful coastal views.',
  "Sweden's design and fashion scene is renowned for its simplicity and elegance."
]

messages_for_sweden.each do |message|
  user_id = user_for_sweden_channel.sample
  Message.create(channel_id: sweden_channel.id, body: message, user_id:)
end
