require 'rspec'

FactoryGirl.define do
	factory :user do
		name     "prueba"
		email    "test@test.es"
		password "foobar"
		password_confirmation "foobar"
	end
end