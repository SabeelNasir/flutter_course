class Employees {
  final String id;
  final String employeeName;
  final String employeeSalary;
  final String profileImage;
  final String employeeAge;

  Employees(
      {this.id,
      this.employeeName,
      this.employeeSalary,
      this.profileImage,
      this.employeeAge});
  factory Employees.fromJson(Map<String, dynamic> json) {
    return Employees(
      id: json['id'],
      employeeName: json['employee_name'],
      employeeSalary: json['employee_salary'],
      employeeAge: json['employee_age'],
      profileImage: json['profile_image'],
    );
  }
}
