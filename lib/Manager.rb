require_relative 'Employee'

class Manager
    attr_reader :name, :department, :age

    @@all = []
    def initialize(name, department, age)
        @name = name
        @department = department
        @age = age
        @@all << self
    end
    
    def self.all
        @@all
    end

    def employees
        Employee.all.select {|employee| employee.manager_name == self.name}
    end

    def hire_employee(name, salary)
        new_employee = Employee.new(name, salary, self.name)
    end

    def self.all_department
        self.all.collect {|manager| manager.department}
    end
    #helper method
    def self.all_ages
        self.all.collect {|manager| manager.age}
    end
    
    def self.average_age
        self.all_ages.inject {|sum, age| sum + age}.to_f / self.all_ages.length
    end

end