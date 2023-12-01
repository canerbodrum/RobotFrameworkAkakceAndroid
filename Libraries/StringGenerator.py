from faker import Faker

fake = Faker()


def generate_name():
    name = fake.name()
    return name.split(" ")[0]


def generate_surname():
    surname = fake.name()
    return surname.split(" ")[1]


def generate_email():
    email = fake.email()
    return email


def generate_password():
    password = fake.password()
    return password
