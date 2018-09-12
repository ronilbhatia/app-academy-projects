function Student(first, last) {
  this.first = first;
  this.last = last;
  this.courses = [];
}

Student.prototype.name = function() {
  return first + " " + last;
};

Student.prototype.hasConflict = function(course) {
  this.courses.forEach(function(c){
    if (c.conflictsWith(course)) {
      return true;
    }
  });
  return false;
};

Student.prototype.enroll = function(course) {
  if (this.hasConflict(course)) {
    throw "This course conflicts with another course";
  }
  this.courses.push(course);
};



Student.prototype.courseLoad = function() {
  const courseLoad = {};
  for (let i = 0; i < this.courses.length; i++) {
    const curr_dep = this.courses[i].department;
    const curr_creds = this.courses[i].credits;
    if (!courseLoad[curr_dep]) {
      courseLoad[curr_dep] = curr_creds;
    } else {
      courseLoad[curr_dep] += curr_creds;
    }
  }
  return courseLoad;
};

function Course(name, department, credits, time, days) {
  this.name = name;
  this.department = department;
  this.credits = credits;
  this.students = [];
  this.time = time;
  this.days = days;
}

Course.prototype.addStudent = function(student) {
  this.students.push(student);
  student.enroll(this);
};

Course.prototype.conflictsWith = function(course) {
  this.days.forEach(function(day) {
    if (course.days.includes(day) && course.time === this.time) {
      return true;
    }
  });
  return false;
};
