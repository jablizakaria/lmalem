# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([
  { email: 'zakaria@rbnb.com', password: '123456' },
  { email: 'mat@rbnb.com', password:  '123456' },
  { email: 'ibrahim@rbnb.com', password:  '123456' },
  { email: 'abdelhadi@rbnb.com', password:  '123456' }
])
specialities = Speciality.create!([
  { name: 'Plomberie', description: 'Plomberie' },
  { name: 'platrerie', description: 'platrerie' },
  { name: 'Peinture', description: 'Peinture' },
  { name: 'Electricité', description: 'Electricité' },
  { name: 'Climatisation', description: 'Climatisation' },
  { name: 'Petits travaux de bricolage', description: 'Petits travaux de bricolage' },
  { name: 'Menuiserie de bois', description: 'Menuiserie de bois' },
  { name: "Menuiserie d'aluminium", description: "Menuiserie d'aluminium" },
  { name: 'Carrelage', description: 'Carrelage' },
  { name: 'Vitrerie', description: 'Vitrerie' },
  { name: 'Parquet', description: 'Parquet' },
  { name: 'Parabole', description: 'Parabole' }
])
users_specialities = UsersSpeciality.create!([
  { avg_behaviour: 5, avg_efficacy: 4, avg_punctuation: 2, description: 'live in homeless people shoes', isvalid: true, speciality_id: 3, user_id: 4 },
  { avg_behaviour: 5, avg_efficacy: 4, avg_punctuation: 5, description: 'live in homeless people shoes', isvalid: true, speciality_id: 1, user_id: 3 },
  { avg_behaviour: 5, avg_efficacy: 5, avg_punctuation: 5, description: 'live in homeless people shoes', isvalid: true, speciality_id: 1, user_id: 3 },
  { avg_behaviour: 5, avg_efficacy: 5, avg_punctuation: 5, description: 'live in homeless people shoes', isvalid: true, speciality_id: 2, user_id: 2 },
  { avg_behaviour: 5, avg_efficacy: 5, avg_punctuation: 4, description: 'live in homeless people shoes', isvalid: true, speciality_id: 2, user_id: 2 },
  { avg_behaviour: 5, avg_efficacy: 5, avg_punctuation: 4, description: 'live in homeless people shoes', isvalid: true, speciality_id: 4, user_id: 1 },
  { avg_behaviour: 5, avg_efficacy: 5, avg_punctuation: 4, description: 'live in homeless people shoes', isvalid: true, speciality_id: 4, user_id: 1 },
  { avg_behaviour: 5, avg_efficacy: 4, avg_punctuation: 2, description: 'live in homeless people shoes', isvalid: true, speciality_id: 3, user_id: 4 },
  { avg_behaviour: 5, avg_efficacy: 4, avg_punctuation: 2, description: 'live in homeless people shoes', isvalid: true, speciality_id: 3, user_id: 4 },
  { avg_behaviour: 5, avg_efficacy: 4, avg_punctuation: 2, description: 'live in homeless people shoes', isvalid: true, speciality_id: 3, user_id: 4 },
  { avg_behaviour: 5, avg_efficacy: 4, avg_punctuation: 2, description: 'live in homeless people shoes', isvalid: true, speciality_id: 3, user_id: 4 },
  { avg_behaviour: 5, avg_efficacy: 4, avg_punctuation: 2, description: 'live in homeless people shoes', isvalid: true, speciality_id: 3, user_id: 4 }
])
interventions = Intervention.create!([
  { status: 'confirmed', users_speciality_id: 3, user_id: 3 },
  { status: 'pending', users_speciality_id: 4, user_id: 3 },
  { status: 'confirmed', users_speciality_id: 2, user_id: 3 },
  { status: 'confirmed', users_speciality_id: 2, user_id: 1 },
  { status: 'pending', users_speciality_id: 2, user_id: 1 },
  { status: 'confirmed', users_speciality_id: 2, user_id: 1 },
  { status: 'pending', users_speciality_id: 1, user_id: 4 },
  { status: 'confirmed', users_speciality_id: 3, user_id: 4 },
  { status: 'pending', users_speciality_id: 3, user_id: 4 },
  { status: 'pending', users_speciality_id: 1, user_id: 2 },
  { status: 'confirmed', users_speciality_id: 1, user_id: 2 },
  { status: 'pending', users_speciality_id: 4, user_id: 2 },
  { status: 'confirmed', users_speciality_id: 4, user_id: 2 },
  { status: 'pending', users_speciality_id: 1, user_id: 2 },
  { status: 'pending', users_speciality_id: 1, user_id: 2 }
])
reviews = Review.create!([
  { puntctuation: 5, efficacy: 3, users_speciality_id: 3, behaviour: 5, commentary: "c'est un mec sympa", isvalid: true, user_id: 1 },
  { puntctuation: 3, efficacy: 5, users_speciality_id: 2, behaviour: 5, commentary: "gentil", isvalid: true, user_id: 2 },
  { puntctuation: 2, efficacy: 5, users_speciality_id: 5, behaviour: 5, commentary: "pro", isvalid: true, user_id: 3 },
  { puntctuation: 1, efficacy: 3, users_speciality_id: 2, behaviour: 5, commentary: "maallem", isvalid: true, user_id: 4 },
  { puntctuation: 4, efficacy: 3, users_speciality_id: 1, behaviour: 5, commentary: "c'est un mec cool", isvalid: true, user_id: 2 },
  { puntctuation: 4, efficacy: 3, users_speciality_id: 3, behaviour: 5, commentary: "c'est un mec ponctuel", isvalid: true, user_id: 3 },
  { puntctuation: 4, efficacy: 3, users_speciality_id: 3, behaviour: 5, commentary: "travail bien fait", isvalid: true, user_id: 1 },
  { puntctuation: 4, efficacy: 3, users_speciality_id: 3, behaviour: 5, commentary: "c'est un mec sympa", isvalid: true, user_id: 4 },
])
