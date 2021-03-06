class Doctor
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name

    @@all << self
  end

  def self.all
    @@all
  end

  def new_appointment(patient, date)
    appt = Appointment.new(self, patient, date)
  end

  def appointments
    Appointment.all.select {|appt| appt.doctor == self}
  end

  def patients
    appts = self.appointments
    appts.map {|appt| appt.patient}
  end
end
