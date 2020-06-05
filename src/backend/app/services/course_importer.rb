# frozen_string_literal: true

require 'csv'
class CourseImporter
  def initialize; end

  #   def call
  #     load_courses
  #     load_ratings
  #   end

  def load_courses
    load_csv('courses.csv').each do |row|
      Course.create(course_level: row['productDifficultyLevel'], course_language: row['language'], course_title: row['name'], course_number: row['name'].downcase.delete(' '), course_image_url: row['imageUrl'], course_description: row['description'])
    end
  end
  #   ActiveRecord::Base.connection.reset_pk_sequence!('table_name')

  def load_ratings
    load_csv('ratings.csv').each do |row|
      rating = Rating.create(user_id: row['user_id'].to_i, course_id: row['course_id'].to_i + 1, rating: row['rating'].to_i)
      Course.transaction do
        course = rating.course
        course.update(reviews_count: course.reviews_count + 1, rating_score: course.rating_score + rating.rating)
      end
    end
  end

  private

  def load_csv(name)
    path = Rails.root.join('app', 'assets', 'dataset', name)
    CSV.parse(File.read(path), headers: true)
  end
end
