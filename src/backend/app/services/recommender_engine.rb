# frozen_string_literal: true

require 'csv'
class RecommenderEngine
  def initialize(user)
    @user = user
  end

  def recommend
    return get_popularity_result if @user.ratings.count < 5

    get_matrix_factorization
  end

  private

  def get_user_enrolment
    @user.enrols.select(:course_id).pluck(:course_id)
  end

  def load_csv(name)
    path = Rails.root.join('app', 'assets', 'dataset', name)
    CSV.parse(File.read(path), headers: true)
  end

  def get_matrix_factorization
    ids = get_user_enrolment
    row = load_csv('matrix-factorization.csv')[@user.id]
    row = row.sort { |a, b| b[1] <=> a[1] }
    course_ids = row.map do |column|
      id = column[0].to_i
      row = id.to_i + 1 unless ids.include?(id.to_i)
    end

    Course.where(id: course_ids).includes([:comments]).includes(:ratings).sort_by { |item| course_ids.index(item.id) }  
  end

  def get_popularity_result
    ids = get_user_enrolment
    course_ids = load_csv('popular.csv').map do |row|
      id = row['course_id']
      row = id.to_i + 1 unless ids.include?(id.to_i)
    end
    Course.where(id: course_ids).includes([:comments]).includes(:ratings).sort_by { |item| course_ids.index(item.id) }  
    
    # .order_by_ids(course_ids)
  end
end
