import sys

def validate_payment(phone, package_id):
   
    return "Success"  

if __name__ == "__main__":
    user_phone = sys.argv[1]
    package_id = sys.argv[2]
    print(validate_payment(user_phone, package_id))
