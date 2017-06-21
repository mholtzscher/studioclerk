require "administrate/base_dashboard"

class StudentDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    lessons: Field::HasMany,
    credits: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    phone: Field::String,
    parent_phone: Field::String,
    notes: Field::Text,
    balance: Field::String.with_options(searchable: false),
    rate: Field::String.with_options(searchable: false),
    email: Field::String,
    parents_email: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    lesson_day: Field::String.with_options(searchable: false),
    lesson_time: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :lessons,
    :credits,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :lessons,
    :credits,
    :id,
    :name,
    :phone,
    :parent_phone,
    :notes,
    :balance,
    :rate,
    :email,
    :parents_email,
    :created_at,
    :updated_at,
    :lesson_day,
    :lesson_time,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :lessons,
    :credits,
    :name,
    :phone,
    :parent_phone,
    :notes,
    :balance,
    :rate,
    :email,
    :parents_email,
    :lesson_day,
    :lesson_time,
  ].freeze

  # Overwrite this method to customize how students are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(student)
  #   "Student ##{student.id}"
  # end
end
