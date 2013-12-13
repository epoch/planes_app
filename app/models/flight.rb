class Flight < ActiveRecord::Base
  attr_accessible :number, :plane_id

  belongs_to :plane
  has_many :reservations
  has_many :passengers, :through => :reservations
  has_many :seats do # association extension
    def [](number)
      detect { |seat| seat.number == number.to_s }
    end    
  end

  # ruby is very expressive but database is more performant at querying data
  def recent_reservations
    reservations.sort_by{|r| r.created_at}.reverse.take(10)
  end  

  # scope :whatever, where(:id => 4) # just syntatic sugar

  # self.whatever
  #   where(:id => 4)
  # end


  # like vs ilike case sensitive
  def self.filter_number(number = nil)    
    return where("number like ?", "%#{number}%") if number # working now
    scoped
  end

  def self.filter_plane_model(model = nil)
    if model
      joins(:plane).where('planes.model = ?', model)
    else
      scoped
    end
  end

  def self.search(attributes = {})
    scope = self.scoped
    scope = scope.filter_number(attributes[:number]) if attributes[:number].present?
    scope = scope.filter_plane_model(attributes[:model]) if attributes[:model].present?    
    scope.scoped
  end

  def self.filter(attributes = {})
    scope = self.scoped
    return scope if attributes.empty?

    attributes.each do |key,value|
      next if value.blank?
      case key.to_sym
      when :number
        scope = scope.where("#{key} = ?", value)
      when :model
        scope = scope.joins(:plane).where("planes.model = ?", value)
      else
        raise 'invalid filter key'
      end                  
    end
    scope 
  end

  # has_many :occupied_seats, :through => :reservations, :source => :seat 

end

