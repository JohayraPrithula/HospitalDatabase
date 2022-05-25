import MySQLdb
db=MySQLdb.connect('localhost','root','','healthcaredatabase')
Q= db.cursor()


def choiceinpt(mx, mn, t):
    inp=input('Enter your choice: ').split()
    if t=='i':
        while (int(inp[0]) > mx or int(inp[0]) < mn):
            inp=input('Invalid input. Enter a valid choice: ')
        return(int(inp[0]))
    elif t=='l':
        for x in range(len(inp)):
            while (int(inp[x]) > mx or int(inp[x]) < mn):
                inp=input('Invalid input. Enter a valid choice: ').split() 
        return (inp)


def getTable():
    Q.execute("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_SCHEMA='healthcaredatabase'")
    t=Q.fetchall()
    arr=[]
    for y in  range(len(t)):
        colName=''
        for x in t[y]:
            if x!='(' or x!=')' or x!=',':
                colName=colName+x
        arr.append(colName)
    print('\n\nWhich table do you want to access?\n')
    for z in range(len(arr)):
            print(str(z+1)+'.'+arr[z])
    return(arr)

def getColumn(table):
    Q.execute("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = N'"+table+"'")
    t=Q.fetchall()
    arr=[]
    for y in  range(len(t)):
        colName=''
        for x in t[y]:
            if x!='(' or x!=')' or x!=',':
                colName=colName+x
        arr.append(colName)
    arr.pop(0)
    return (arr)


def colname(cols, choice):
    colnm=''
    for x in range(len(choice)):
        colnm=colnm+'`'+cols[int(choice[x])-1]+'`'
        if x!=len(choice)-1:
               colnm=colnm+','
    return(colnm)


def showTable(table):
    if (not table):
        print('No existing entry.')
    for x in range(len(table)):
        print('-----')
        for y in table[x]:
            if y==',':
                print("    ", end="")
        print(table[x])
    
                 
        
    
def add(table):
    cols=getColumn(table)
    choice=[]
    for x in range(1,len(cols)+1):
        choice.append(x)
    coldata=colname(cols,choice)
    print('\n\nAdding to '+table+'.Enter your data.\nPlease enter Time and Date in(hh:mm) and (yyyy/mm/dd) format.\n', end="")
    val=[]
    for x in range(0,len(cols)):
        val.append(input(cols[x]+': '))
    inpt=''
    for y in range(len(val)):
        inpt=inpt+"'"+val[y]+"'"
        if y!=len(val)-1:
               inpt=inpt+','        
    Q.execute("INSERT INTO `"+table+"`("+coldata+")VALUES("+inpt+")")    
    
                

def retrieve(table):
    cols=getColumn(table)
    
    print("\n\nWhich informations do you want to query with?\n1.Show complete columns\n2.Show between a range\n3.Include a particular pattern\n4.Show a record\n5.Sort columns")
    select=choiceinpt(5,1,'i')
    
    print('\n\nwhich columns do you want to show? Write your choices using a space.\n\n0.All')
    for z in range(len(cols)):
        print(str(z+1)+'.'+cols[z])
    choice=choiceinpt(len(cols),0,'l')
    if choice[0]=='0':
        coldata='*'
    else:
        coldata=colname(cols,choice)
    if select==1:
        Q.execute("SELECT "+coldata+" FROM `"+table+"`")
        showTable(Q.fetchall())
    elif select==2:
        print('\nWhich column do you want range in?')
        for z in range(len(cols)):
            print(str(z+1)+'.'+cols[z])
        col=cols[choiceinpt(len(cols), 1,'i')]
        print('What values do you want to search between?')
        val1=input('Value 1: ')
        val2=input('Value 2: ')
        Q.execute("SELECT "+coldata+" FROM `"+table+"` WHERE `"+col+"` BETWEEN '"+val1+"' AND '"+val2+"';")
        showTable(Q.fetchall())
    elif select==3:
        print('\nIn which column do you want to search for the pattern?')
        for z in range(len(cols)):
            print(str(z+1)+'.'+cols[z])
        col=cols[choiceinpt(len(cols), 1, 'i')-1]
        pat=input('Which pattern do you want to search?: ')
        Q.execute("SELECT "+coldata+" FROM `"+table+"` WHERE `"+col+"` LIKE '%"+pat+"%';")
        showTable(Q.fetchall())
    elif select==4:
        rec=input('\nEnter the name of the record you want to show: ')
        Q.execute("SELECT "+coldata+" FROM `"+table+"` WHERE `name`='"+rec+"';")
        showTable(Q.fetchall())
    elif select==5:
        print('\nWhich columns do you want to sort')
        for z in range(len(cols)):
            print(str(z+1)+'.'+cols[z])
        sort=cols[choiceinpt(len(cols), 1,'i')-1]
        print('which order do you want to sort in?\n1.Ascending\n2.Descending')
        order=choiceinpt(2, 1, 'i')
        if order==1:
            order='ASC'
        else:
            order='DESC'
            
        Q.execute("SELECT "+coldata+" FROM `"+table+"` ORDER BY "+sort+" "+order+";")
        showTable(Q.fetchall())
        
def update(table):
    cols=getColumn(table)
    print("\n\nShowing existing data from table "+table+'\n\n')
    Q.execute("SELECT * FROM `"+table+"`")
    showTable(Q.fetchall())
    print('\n\nWhich record do you want to update in '+table, end="")
    entry=input('Enter the id: ') 
    print('\nEnter your Data.Please enter Time and Date in(hh:mm) and (yyyy/mm/dd) format.\n')
    data=''
    for x in range(len(cols)):
        data=data+"`"+cols[x]+"`='"+input(cols[x]+": ")+"'"
        if x!=len(cols)-1:
            data=data+','
            
    Q.execute("UPDATE `"+table+"` SET "+data+" WHERE id='"+entry+"';")
    print('\n\nUpdated table: \n')
    Q.execute("SELECT * FROM `"+table+"`")
    showTable(Q.fetchall())
    
        
def delete(table):
    print("\n\nShowing existing data from table "+table+'\n\n')
    Q.execute("SELECT * FROM `"+table+"`")
    showTable(Q.fetchall())
    print('\n\nWhich record do you want to delete from '+table, end="")
    data=input('Enter the id: ') 
    Q.execute("DELETE FROM `"+table+"` WHERE id='"+data+"'")
    print("\n\nShowing changed data from table "+table+'\n\n')
    Q.execute("SELECT * FROM `"+table+"`")
    showTable(Q.fetchall())
     
    
def create():
    name=input('Enter Your Table Name: ')
    print('\nHow many column do you want?', end='',)
    cols=choiceinpt(4096,1,'i')
    data=''
    for x in range (1,cols+1):
        data= data+input('Enter Your Column '+str(x)+' Name:')+' '
        t=input('Enter Your Column '+str(x)+' Datatype:')
        data= data+t.upper()
        if x<cols:
            data=data+','
    Q.execute('CREATE TABLE '+name+'('+data+');')   