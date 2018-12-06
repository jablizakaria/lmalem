# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([
  { email: 'zakaria@rbnb.com', encrypted_password: '' },
  { email: 'mat@rbnb.com', encrypted_password: '' },
  { email: 'ibrahim@rbnb.com', encrypted_password: '' },
  { email: 'abdelhadi@rbnb.com', encrypted_password: '' }
])
specialities = Speciality.create([
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
interventions = Intervention.create([
  { status: 'confirmed', users_speciality: 3, user: 3 },
  { status: 'pending', users_speciality: 4, user: 3 },
  { status: 'confirmed', users_speciality: 2, user: 3 },
  { status: 'confirmed', users_speciality: 2, user: 1 },
  { status: 'pending', users_speciality: 2, user: 1 },
  { status: 'confirmed', users_speciality: 2, user: 1 },
  { status: 'pending', users_speciality: 1, user: 4 },
  { status: 'confirmed', users_speciality: 3, user: 4 },
  { status: 'pending', users_speciality: 3, user: 4 },
  { status: 'pending', users_speciality: 1, user: 2 },
  { status: 'confirmed', users_speciality: 1, user: 2 },
  { status: 'pending', users_speciality: 4, user: 2 },
  { status: 'confirmed', users_speciality: 4, user: 2 },
  { status: 'pending', users_speciality: 1, user: 2 },
  { status: 'pending', users_speciality: 1, user: 2 }
])
reviews = Review.create([
  { puntctuation: 5, efficacy: 3, users_speciality: 3, behaviour: 5, commentary: "c'est un mec sympa", isvalid: true, user: 1 },
  { puntctuation: 3, efficacy: 5, users_speciality: 2, behaviour: 5, commentary: "gentil", isvalid: true, user: 2 },
  { puntctuation: 2, efficacy: 5, users_speciality: 5, behaviour: 5, commentary: "pro", isvalid: true, user: 3 },
  { puntctuation: 1, efficacy: 3, users_speciality: 2, behaviour: 5, commentary: "maallem", isvalid: true, user: 4 },
  { puntctuation: 4, efficacy: 3, users_speciality: 1, behaviour: 5, commentary: "c'est un mec cool", isvalid: true, user: 2 },
  { puntctuation: 4, efficacy: 3, users_speciality: 3, behaviour: 5, commentary: "c'est un mec ponctuel", isvalid: true, user: 3 },
  { puntctuation: 4, efficacy: 3, users_speciality: 3, behaviour: 5, commentary: "travail bien fait", isvalid: true, user: 1 },
  { puntctuation: 4, efficacy: 3, users_speciality: 3, behaviour: 5, commentary: "c'est un mec sympa", isvalid: true, user: 4 },
])

users_specialities = Users_speciality.create([
  { avg_behaviour: 5, avg_efficacy: 4, avg_punctuation: 2, description: 'live in homeless people shoes', isvalid: true, speciality: 3, user: 4 },
  { avg_behaviour: 5, avg_efficacy: 4, avg_punctuation: 5, description: 'live in homeless people shoes', isvalid: true, speciality: 1, user: 3 },
  { avg_behaviour: 5, avg_efficacy: 5, avg_punctuation: 5, description: 'live in homeless people shoes', isvalid: true, speciality: 1, user: 3 },
  { avg_behaviour: 5, avg_efficacy: 5, avg_punctuation: 5, description: 'live in homeless people shoes', isvalid: true, speciality: 2, user: 2 },
  { avg_behaviour: 5, avg_efficacy: 5, avg_punctuation: 4, description: 'live in homeless people shoes', isvalid: true, speciality: 2, user: 2 },
  { avg_behaviour: 5, avg_efficacy: 5, avg_punctuation: 4, description: 'live in homeless people shoes', isvalid: true, speciality: 4, user: 1 },
  { avg_behaviour: 5, avg_efficacy: 5, avg_punctuation: 4, description: 'live in homeless people shoes', isvalid: true, speciality: 4, user: 1 },
  { avg_behaviour: 5, avg_efficacy: 4, avg_punctuation: 2, description: 'live in homeless people shoes', isvalid: true, speciality: 3, user: 4 },
  { avg_behaviour: 5, avg_efficacy: 4, avg_punctuation: 2, description: 'live in homeless people shoes', isvalid: true, speciality: 3, user: 4 },
  { avg_behaviour: 5, avg_efficacy: 4, avg_punctuation: 2, description: 'live in homeless people shoes', isvalid: true, speciality: 3, user: 4 },
  { avg_behaviour: 5, avg_efficacy: 4, avg_punctuation: 2, description: 'live in homeless people shoes', isvalid: true, speciality: 3, user: 4 },
  { avg_behaviour: 5, avg_efficacy: 4, avg_punctuation: 2, description: 'live in homeless people shoes', isvalid: true, speciality: 3, user: 4 }
])
