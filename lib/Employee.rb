require_relative "Manager"

class Employee
    attr_reader :name, :salary, :manager_name

    @@all = []
    def initialize(name, salary, manager_name)
        @name = name
        @salary = salary
        @manager_name = manager_name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.paid_over(overpaid)
        self.all.select {|employee| employee.salary > overpaid}
    end

    def self.find_by_department(department_name)
        manager_by_dep = Manager.all.find {|manager| manager.department == department_name}
        self.all.find {|employee| employee.manager_name == manager_by_dep.name}
    end

    def tax_bracket
        max = self.salary + 1000
        min = self.salary - 1000
    
        Employee.all.select {|employee| employee.salary > min && employee.salary < max }
    end
end
