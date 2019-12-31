# frozen_string_literal: true

Gender.find_or_create_by(name: 'Masculino')
Gender.find_or_create_by(name: 'Femenino')
Gender.find_or_create_by(name: 'LGBTQ+')
Gender.find_or_create_by(name: 'Não tenho gênero definido')