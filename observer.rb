class Employee
  attr_reader :name, :title, :salary

  def initialize(name, title, salary, payroll)
    @name = name
    @title = title
    @salary = salary
    @payroll = payroll
  end

  def salary=(new_salary)
    @salary = new_salary
    @payroll.update(self)
  end
end

class Payroll
  def update(changed_employee)
    puts "#{changed_employee.name}の給料は#{changed_employee.salary}になりました"
    puts "#{changed_employee.name}のために新しい小切手を切ります"
  end
end

payroll = Payroll.new
fred = Employee.new('Fred Flintstone', 'Crane Operator', 30000.0, payroll)
fred.salary = 35000.0
