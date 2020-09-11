class Link < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes
  has_one_attached :image
  scope :hottest, -> { order(hot_score: :desc) }

  validates :title,
            presence: true,
            uniqueness: { case_sensitive: false }

  validates :url,
            format: { with: %r{\Ahttps?://} },
            allow_blank: true

  def comment_count
    comments.length
  end

  def upvotes
    votes.sum(:upvote)
  end

  def downvotes
    votes.sum(:downvote)
  end

  def calc_hot_score
    points = upvotes - downvotes
    time_ago_in_hours = ((Time.now - created_at) / 3600).round
    score = hot_score(points, time_ago_in_hours)

    update_attributes(points: points, hot_score: score)
  end

  private

  def hot_score(points, time_ago_in_hours, gravity = 1.5)
    (points - 1) / (time_ago_in_hours + 2)**gravity
  end
end
