class Guest < ActiveRecord::Base
  has_many :companions, dependent: :destroy
  accepts_nested_attributes_for :companions
  validates :full_name, presence: true
  validates :email, presence: true, uniqueness: true

  before_create :strong_id
  before_save :proper_name

  def to_s
    full_name
  end

  protected

  def strong_id
    new_id = rand(100..999)
    while !Guest.where(id: new_id).empty?
      new_id = rand(100..999)
    end
    self.id = new_id
  end

  def proper_name
    self.full_name = self.full_name.split.map{|s| s.capitalize}.join(' ')
  end

  def self.going_count
    count = 0
    Guest.where(attending: true).each do |g|
      count +=1
      count += g.plus
    end
    count
  end

  def self.invited_count
    count = 0
    Guest.all.each do |g|
      count +=1
      count += g.plus
    end
    count
  end

end
