require 'observer'

class Employee
  include Observable

  attr_reader :name, :title, :salary

  def initialize(name, title, salary)
    super()
    @name = name
    @title = title
    @salary = salary
  end

  def salary=(new_salary)
    @salary = new_salary
    changed
    notify_observers(self)
  end
end

class Payroll
  def update(changed_employee)
    puts "#{changed_employee.name}の給料は#{changed_employee.salary}になりました"
    puts "#{changed_employee.name}のために新しい小切手を切ります"
  end
end

fred = Employee.new('Fred Flintstone', 'Crane Operator', 30000.0)

payroll = Payroll.new
fred.add_observer(payroll)

fred.salary = 35000.0
