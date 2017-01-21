class System
  attr_reader :bodies
  attr_accessor :add, :total_mass

   @@systems = []

   def self.systems
     @@systems
   end

  def initialize(bodies = [])
    @bodies = bodies
    @@systems << self
  end

  def add(body)
    if @bodies.include?(body)
      return "Sorry, this body already exists in the system"
    else
      @bodies << body
    end
  end

  def total_mass
    count = 0
    @bodies.each do |ma|
      count += ma.mass
    end
    return count
  end

  def self.gal_mass
    mass = 0
    systems.each do |system|
      system.total_mass
    mass += system.total_mass
    end
    return mass
  end
end

class Body
  attr_reader :name, :mass
  def initialize(name, mass)
    @name = name
    @mass = mass
  end
end

class Planet < Body
  attr_reader :mass
  def initialize(name, mass, day, year)
    super(name, mass)
    @day = day
    @year = year
  end

  def self.all(syst)
    planets = []
    syst.bodies.each do |body|
      if body.class == Planet
      planets << body
      end
    end
   return planets
  end
end

class Moon < Body
  attr_reader :mass
  def initialize(name, mass, month, planet)
    super(name, mass)
    @month = month
    @planet = planet
  end

  def self.all(syst)
    moons = []
    syst.bodies.each do |body|
      if body.class == Moon
      moons << body
      end
    end
   return moons
  end
end

class Star < Body
  attr_reader :mass
  def initialize(name, mass, type)
    super(name, mass)
    @type = type
  end

  def self.all(syst)
    stars = []
    syst.bodies.each do |body|
      if body.class == Star
      stars << body
      end
    end
   return stars
  end
end

sun = Star.new("sun", 10, "G-type")

earth = Planet.new("earth", 3, 24, 365)

moon = Moon.new("moon", 1, 27, "earth")
