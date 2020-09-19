use [�Ыι���n�J�t��]

/*
 ���ʲ��R��
*/

insert [land].[Main_a]
execute sp_execute_external_script
@language = N'Python',
@script = N'
from glob import glob
import pandas as pd

path = r"C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\PYTHON_SERVICES\lvr_landcsv"
pattern = ["?_lvr_land_a.csv",\
           "?_lvr_land_a_build.csv",\
           "?_lvr_land_a_land.csv",\
           "?_lvr_land_a_park.csv",\
           "?_lvr_land_b.csv",\
           "?_lvr_land_b_build.csv",\
           "?_lvr_land_b_land.csv",\
           "?_lvr_land_b_park.csv",\
           "?_lvr_land_c.csv",\
           "?_lvr_land_c_build.csv",\
           "?_lvr_land_c_land.csv",\
           "?_lvr_land_c_park.csv"]

for i in [0]:
    
    files = glob(path + "\\" + pattern[i])
    
    for f in files:
        
        df = pd.read_csv(f)
        df = df.iloc[1:]
        df = df.fillna(value="")
        
        if "����~���" in df:

            for index, row in df.iterrows():
                row.����~��� = str(int(row.����~���) + 19110000)

                if bool(row.�ؿv�����~��):
                    row.�ؿv�����~�� = str(int(row.�ؿv�����~��) + 19110000)

            OutputDataSet = OutputDataSet.append(df)
'

/*
 �w��ζR��
*/

insert [land].[Main_b]
execute sp_execute_external_script
@language = N'Python',
@script = N'
from glob import glob
import pandas as pd

path = r"C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\PYTHON_SERVICES\lvr_landcsv"
pattern = ["?_lvr_land_a.csv",\
           "?_lvr_land_a_build.csv",\
           "?_lvr_land_a_land.csv",\
           "?_lvr_land_a_park.csv",\
           "?_lvr_land_b.csv",\
           "?_lvr_land_b_build.csv",\
           "?_lvr_land_b_land.csv",\
           "?_lvr_land_b_park.csv",\
           "?_lvr_land_c.csv",\
           "?_lvr_land_c_build.csv",\
           "?_lvr_land_c_land.csv",\
           "?_lvr_land_c_park.csv"]

for i in [4]:
    
    files = glob(path + "\\" + pattern[i])
    
    for f in files:
        
        df = pd.read_csv(f)
        df = df.iloc[1:]
        df = df.fillna(value="")
        
        if "����~���" in df:

            for index, row in df.iterrows():
                row.����~��� = str(int(row.����~���) + 19110000)

                if bool(row.�ؿv�����~��):
                    row.�ؿv�����~�� = str(int(row.�ؿv�����~��) + 19110000)

            OutputDataSet = OutputDataSet.append(df)
'


/*
 Main_Rent �����ɮ�
*/
insert [land].[c_Main_Rent]
execute sp_execute_external_script
@language = N'Python',
@script = N'
from glob import glob
import pandas as pd

path = r"C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\PYTHON_SERVICES\lvr_landcsv"
pattern = ["?_lvr_land_a.csv",\
           "?_lvr_land_a_build.csv",\
           "?_lvr_land_a_land.csv",\
           "?_lvr_land_a_park.csv",\
           "?_lvr_land_b.csv",\
           "?_lvr_land_b_build.csv",\
           "?_lvr_land_b_land.csv",\
           "?_lvr_land_b_park.csv",\
           "?_lvr_land_c.csv",\
           "?_lvr_land_c_build.csv",\
           "?_lvr_land_c_land.csv",\
           "?_lvr_land_c_park.csv"]


for i in [8]:
    #path_filename = path + "\\" + pattern[i]
    #print(path + "\\" + pattern[i])
    
    files = glob(path + "\\" + pattern[i])
    
    for f in files:
        
        df = pd.read_csv(f)
        df = df.iloc[1:]
        df = df.fillna(value="")

        if "����~���" in df:
            
            for index, row in df.iterrows():
                row.����~��� = str(int(row.����~���) + 19110000)

                if bool(row.�ؿv�����~��):
                    row.�ؿv�����~�� = str(int(row.�ؿv�����~��) + 19110000)

            OutputDataSet = OutputDataSet.append(df)
'

--------------------------------------------------------------------------------
/*
 Build �ت����ʲ��R��
*/
insert [land].[a_Build]
execute sp_execute_external_script
@language = N'Python',
@script = N'
from glob import glob
from datetime import datetime
import pandas as pd

path = r"C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\PYTHON_SERVICES\lvr_landcsv"
pattern = ["?_lvr_land_a.csv",\
           "?_lvr_land_a_build.csv",\
           "?_lvr_land_a_land.csv",\
           "?_lvr_land_a_park.csv",\
           "?_lvr_land_b.csv",\
           "?_lvr_land_b_build.csv",\
           "?_lvr_land_b_land.csv",\
           "?_lvr_land_b_park.csv",\
           "?_lvr_land_c.csv",\
           "?_lvr_land_c_build.csv",\
           "?_lvr_land_c_land.csv",\
           "?_lvr_land_c_park.csv"]

for i in [1]:
    
    files = glob(path + "\\" + pattern[i])
    
    for f in files:
        
        df = pd.read_csv(f)
        df = df.iloc[1:]
        df = df.fillna(value="")

        if "�ؿv�������" in df:
            
            for index, row in df.iterrows():
                
                if bool(row.�ؿv�������):
                    yp = row.�ؿv�������.find("�~")
                    y = int(row.�ؿv�������[: yp]) + 1911

                    mp = row.�ؿv�������.find("��")
                    m = int(row.�ؿv�������[yp + 1 : mp])

                    dp = row.�ؿv�������.find("��")
                    d = int(row.�ؿv�������[mp + 1 : dp])

                    ymd = str(datetime(y, m, d))[:10]
                    row.�ؿv������� = ymd
                    
            OutputDataSet = OutputDataSet.append(df)
'

/*
 Land �g�a���ʲ��R��
*/
insert [land].[a_Land]

execute sp_execute_external_script
@language = N'Python',
@script = N'
from glob import glob
import pandas as pd

path = r"C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\PYTHON_SERVICES\lvr_landcsv"
pattern = ["?_lvr_land_a.csv",\
           "?_lvr_land_a_build.csv",\
           "?_lvr_land_a_land.csv",\
           "?_lvr_land_a_park.csv",\
           "?_lvr_land_b.csv",\
           "?_lvr_land_b_build.csv",\
           "?_lvr_land_b_land.csv",\
           "?_lvr_land_b_park.csv",\
           "?_lvr_land_c.csv",\
           "?_lvr_land_c_build.csv",\
           "?_lvr_land_c_land.csv",\
           "?_lvr_land_c_park.csv"]

for i in [2]:
    
    files = glob(path + "\\" + pattern[i])
    
    for f in files:
        
        df = pd.read_csv(f)
        df = df.iloc[1:]
        df = df.fillna(value="")

                   
        OutputDataSet = OutputDataSet.append(df)
'



--------------------------------------------------------------------------------
/*
 Park ���������ʲ��R��
*/
insert [land].[a_Park]

execute sp_execute_external_script
@language = N'Python',
@script = N'
from glob import glob
import pandas as pd

path = r"C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\PYTHON_SERVICES\lvr_landcsv"
pattern = ["?_lvr_land_a.csv",\
           "?_lvr_land_a_build.csv",\
           "?_lvr_land_a_land.csv",\
           "?_lvr_land_a_park.csv",\
           "?_lvr_land_b.csv",\
           "?_lvr_land_b_build.csv",\
           "?_lvr_land_b_land.csv",\
           "?_lvr_land_b_park.csv",\
           "?_lvr_land_c.csv",\
           "?_lvr_land_c_build.csv",\
           "?_lvr_land_c_land.csv",\
           "?_lvr_land_c_park.csv"]


for i in [3]:
    
    files = glob(path + "\\" + pattern[i])
    
    for f in files:
        
        df = pd.read_csv(f)
        df = df.iloc[1:]
        df = df.fillna(value="")

                   
        OutputDataSet = OutputDataSet.append(df)
'

--------------------------------------------------------------------------------
/*
 Land �g�a�w��ζR��
*/
insert [land].[b_Land]

execute sp_execute_external_script
@language = N'Python',
@script = N'
from glob import glob
import pandas as pd

path = r"C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\PYTHON_SERVICES\lvr_landcsv"
pattern = ["?_lvr_land_a.csv",\
           "?_lvr_land_a_build.csv",\
           "?_lvr_land_a_land.csv",\
           "?_lvr_land_a_park.csv",\
           "?_lvr_land_b.csv",\
           "?_lvr_land_b_build.csv",\
           "?_lvr_land_b_land.csv",\
           "?_lvr_land_b_park.csv",\
           "?_lvr_land_c.csv",\
           "?_lvr_land_c_build.csv",\
           "?_lvr_land_c_land.csv",\
           "?_lvr_land_c_park.csv"]

for i in [6]:
    
    files = glob(path + "\\" + pattern[i])
    
    for f in files:
        
        df = pd.read_csv(f)
        df = df.iloc[1:]
        df = df.fillna(value="")

                   
        OutputDataSet = OutputDataSet.append(df)
'



/*
 Park �������w��ζR��
*/
insert [land].[b_Park]

execute sp_execute_external_script
@language = N'Python',
@script = N'
from glob import glob
import pandas as pd

path = r"C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\PYTHON_SERVICES\lvr_landcsv"
pattern = ["?_lvr_land_a.csv",\
           "?_lvr_land_a_build.csv",\
           "?_lvr_land_a_land.csv",\
           "?_lvr_land_a_park.csv",\
           "?_lvr_land_b.csv",\
           "?_lvr_land_b_build.csv",\
           "?_lvr_land_b_land.csv",\
           "?_lvr_land_b_park.csv",\
           "?_lvr_land_c.csv",\
           "?_lvr_land_c_build.csv",\
           "?_lvr_land_c_land.csv",\
           "?_lvr_land_c_park.csv"]


for i in [7]:
    
    files = glob(path + "\\" + pattern[i])
    
    for f in files:
        
        df = pd.read_csv(f)
        df = df.iloc[1:]
        df = df.fillna(value="")

                   
        OutputDataSet = OutputDataSet.append(df)
'



--------------------------------------------------------------------------------
/*
 Build �ت����ʲ�����
*/
insert [land].[c_Build]

execute sp_execute_external_script
@language = N'Python',
@script = N'
from glob import glob
from datetime import datetime
import pandas as pd

path = r"C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\PYTHON_SERVICES\lvr_landcsv"
pattern = ["?_lvr_land_a.csv",\
           "?_lvr_land_a_build.csv",\
           "?_lvr_land_a_land.csv",\
           "?_lvr_land_a_park.csv",\
           "?_lvr_land_b.csv",\
           "?_lvr_land_b_build.csv",\
           "?_lvr_land_b_land.csv",\
           "?_lvr_land_b_park.csv",\
           "?_lvr_land_c.csv",\
           "?_lvr_land_c_build.csv",\
           "?_lvr_land_c_land.csv",\
           "?_lvr_land_c_park.csv"]

for i in [9]:
    
    files = glob(path + "\\" + pattern[i])
    
    for f in files:
        
        df = pd.read_csv(f)
        df = df.iloc[1:]
        df = df.fillna(value="")

        if "�ؿv�������" in df:
            
            for index, row in df.iterrows():
                
                if bool(row.�ؿv�������):
                    yp = row.�ؿv�������.find("�~")
                    y = int(row.�ؿv�������[: yp]) + 1911

                    mp = row.�ؿv�������.find("��")
                    m = int(row.�ؿv�������[yp + 1 : mp])

                    dp = row.�ؿv�������.find("��")
                    d = int(row.�ؿv�������[mp + 1 : dp])

                    ymd = str(datetime(y, m, d))[:10]
                    row.�ؿv������� = ymd
                    
            OutputDataSet = OutputDataSet.append(df)
'


/*
 Land �g�a���ʲ�����
*/
insert [land].[c_Land]

execute sp_execute_external_script
@language = N'Python',
@script = N'
from glob import glob
import pandas as pd

path = r"C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\PYTHON_SERVICES\lvr_landcsv"
pattern = ["?_lvr_land_a.csv",\
           "?_lvr_land_a_build.csv",\
           "?_lvr_land_a_land.csv",\
           "?_lvr_land_a_park.csv",\
           "?_lvr_land_b.csv",\
           "?_lvr_land_b_build.csv",\
           "?_lvr_land_b_land.csv",\
           "?_lvr_land_b_park.csv",\
           "?_lvr_land_c.csv",\
           "?_lvr_land_c_build.csv",\
           "?_lvr_land_c_land.csv",\
           "?_lvr_land_c_park.csv"]

for i in [10]:
    
    files = glob(path + "\\" + pattern[i])
    
    for f in files:
        
        df = pd.read_csv(f)
        df = df.iloc[1:]
        df = df.fillna(value="")

                   
        OutputDataSet = OutputDataSet.append(df)
'




/*
 Park ���������ʲ�����
*/

insert [land].[c_Park]

execute sp_execute_external_script
@language = N'Python',
@script = N'
from glob import glob
import pandas as pd

path = r"C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\PYTHON_SERVICES\lvr_landcsv"
pattern = ["?_lvr_land_a.csv",\
           "?_lvr_land_a_build.csv",\
           "?_lvr_land_a_land.csv",\
           "?_lvr_land_a_park.csv",\
           "?_lvr_land_b.csv",\
           "?_lvr_land_b_build.csv",\
           "?_lvr_land_b_land.csv",\
           "?_lvr_land_b_park.csv",\
           "?_lvr_land_c.csv",\
           "?_lvr_land_c_build.csv",\
           "?_lvr_land_c_land.csv",\
           "?_lvr_land_c_park.csv"]


for i in [11]:
    
    files = glob(path + "\\" + pattern[i])
    
    for f in files:
        
        df = pd.read_csv(f)
        df = df.iloc[1:]
        df = df.fillna(value="")

                   
        OutputDataSet = OutputDataSet.append(df)
'
