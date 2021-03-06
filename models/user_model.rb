#Author:: Jack Cheng Ding Han
class UserModel
  #Constructor Method
  def initialize(arg)
    #initialize instance variables
    @record = $database.execute('SELECT * FROM Users WHERE UserName=?;', arg)[0]
  end

  #Accessor Method
  def record
    @record
  end

  #Mutator Method
  def set_account_money(new_balance)
    prepared_statement = 'UPDATE users SET AccountMoney=? WHERE twitterHandle=?;'
    $database.prepare(prepared_statement).execute(new_balance, @record[0])
  end

  #Class Method
  def self.all_users
    $database.execute('SELECT * FROM users;')
  end

  #Class Method
  def self.is_member(a_handle)
    !(UserModel.new(a_handle).record.nil?)
  end
end
