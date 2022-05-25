"""
All Gender Should Be Included in F/M
All Time Should be Formatted in hh:mm Format
All Date has to Formatted in yyyy/mm/dd Format
Library used: https://mysqlclient.readthedocs.io/user_guide.html

"""

  
import MySQLdb
from HealthCareDataBaseFunctions import *
    
print('------------------------------------------------------------------------\n----------------------Healthcare Management System----------------------\n------------------------------------------------------------------------\n1.Add\n2.Retrieve\n3.Update\n4.Delete\n5.Create a New Table')
       
task=choiceinpt(5,1,'i')
 
if task!=5:
    tab=getTable()
    tble=choiceinpt(len(tab),1,'i')
 
if task==1:
    add(tab[tble-1])
elif task==2:
    retrieve(tab[tble-1])
elif task==3:
    update(tab[tble-1])
elif task==4:
    delete(tab[tble-1])
elif task==5:
    create()  
    
save=input('\n\nDo you want to save the changes? [Y/N]: ')
if save=='Y' or save=='y':
    db.commit()
    print('Changes Saved')