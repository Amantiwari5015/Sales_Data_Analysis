<h1>Step 1 — Load & Understand Raw Data</h1>


```python
import pandas as pd 
import numpy as np 
import matplotlib.pyplot as plt 
import seaborn as sns
```


```python
df = pd.read_csv(r"C:\Users\ankit\OneDrive\Desktop\Ecommerse Sales Analysis\Data\Raw\Online Retail.csv")
```


```python
df
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>InvoiceNo</th>
      <th>StockCode</th>
      <th>Description</th>
      <th>Quantity</th>
      <th>InvoiceDate</th>
      <th>UnitPrice</th>
      <th>CustomerID</th>
      <th>Country</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>536365</td>
      <td>85123A</td>
      <td>WHITE HANGING HEART T-LIGHT HOLDER</td>
      <td>6</td>
      <td>12/1/2010 8:26</td>
      <td>2.55</td>
      <td>17850.0</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>1</th>
      <td>536365</td>
      <td>71053</td>
      <td>WHITE METAL LANTERN</td>
      <td>6</td>
      <td>12/1/2010 8:26</td>
      <td>3.39</td>
      <td>17850.0</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>2</th>
      <td>536365</td>
      <td>84406B</td>
      <td>CREAM CUPID HEARTS COAT HANGER</td>
      <td>8</td>
      <td>12/1/2010 8:26</td>
      <td>2.75</td>
      <td>17850.0</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>3</th>
      <td>536365</td>
      <td>84029G</td>
      <td>KNITTED UNION FLAG HOT WATER BOTTLE</td>
      <td>6</td>
      <td>12/1/2010 8:26</td>
      <td>3.39</td>
      <td>17850.0</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>4</th>
      <td>536365</td>
      <td>84029E</td>
      <td>RED WOOLLY HOTTIE WHITE HEART.</td>
      <td>6</td>
      <td>12/1/2010 8:26</td>
      <td>3.39</td>
      <td>17850.0</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>541904</th>
      <td>581587</td>
      <td>22613</td>
      <td>PACK OF 20 SPACEBOY NAPKINS</td>
      <td>12</td>
      <td>12/9/2011 12:50</td>
      <td>0.85</td>
      <td>12680.0</td>
      <td>France</td>
    </tr>
    <tr>
      <th>541905</th>
      <td>581587</td>
      <td>22899</td>
      <td>CHILDREN'S APRON DOLLY GIRL</td>
      <td>6</td>
      <td>12/9/2011 12:50</td>
      <td>2.10</td>
      <td>12680.0</td>
      <td>France</td>
    </tr>
    <tr>
      <th>541906</th>
      <td>581587</td>
      <td>23254</td>
      <td>CHILDRENS CUTLERY DOLLY GIRL</td>
      <td>4</td>
      <td>12/9/2011 12:50</td>
      <td>4.15</td>
      <td>12680.0</td>
      <td>France</td>
    </tr>
    <tr>
      <th>541907</th>
      <td>581587</td>
      <td>23255</td>
      <td>CHILDRENS CUTLERY CIRCUS PARADE</td>
      <td>4</td>
      <td>12/9/2011 12:50</td>
      <td>4.15</td>
      <td>12680.0</td>
      <td>France</td>
    </tr>
    <tr>
      <th>541908</th>
      <td>581587</td>
      <td>22138</td>
      <td>BAKING SET 9 PIECE RETROSPOT</td>
      <td>3</td>
      <td>12/9/2011 12:50</td>
      <td>4.95</td>
      <td>12680.0</td>
      <td>France</td>
    </tr>
  </tbody>
</table>
<p>541909 rows × 8 columns</p>
</div>




```python
# Check number of rows and columns
df.shape
```




    (541909, 8)




```python
# View column names
df.columns
```




    Index(['InvoiceNo', 'StockCode', 'Description', 'Quantity', 'InvoiceDate',
           'UnitPrice', 'CustomerID', 'Country'],
          dtype='str')




```python
# View first 5 rows
df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>InvoiceNo</th>
      <th>StockCode</th>
      <th>Description</th>
      <th>Quantity</th>
      <th>InvoiceDate</th>
      <th>UnitPrice</th>
      <th>CustomerID</th>
      <th>Country</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>536365</td>
      <td>85123A</td>
      <td>WHITE HANGING HEART T-LIGHT HOLDER</td>
      <td>6</td>
      <td>12/1/2010 8:26</td>
      <td>2.55</td>
      <td>17850.0</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>1</th>
      <td>536365</td>
      <td>71053</td>
      <td>WHITE METAL LANTERN</td>
      <td>6</td>
      <td>12/1/2010 8:26</td>
      <td>3.39</td>
      <td>17850.0</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>2</th>
      <td>536365</td>
      <td>84406B</td>
      <td>CREAM CUPID HEARTS COAT HANGER</td>
      <td>8</td>
      <td>12/1/2010 8:26</td>
      <td>2.75</td>
      <td>17850.0</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>3</th>
      <td>536365</td>
      <td>84029G</td>
      <td>KNITTED UNION FLAG HOT WATER BOTTLE</td>
      <td>6</td>
      <td>12/1/2010 8:26</td>
      <td>3.39</td>
      <td>17850.0</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>4</th>
      <td>536365</td>
      <td>84029E</td>
      <td>RED WOOLLY HOTTIE WHITE HEART.</td>
      <td>6</td>
      <td>12/1/2010 8:26</td>
      <td>3.39</td>
      <td>17850.0</td>
      <td>United Kingdom</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Check data types and non-null values
df.info()
```

    <class 'pandas.DataFrame'>
    RangeIndex: 541909 entries, 0 to 541908
    Data columns (total 8 columns):
     #   Column       Non-Null Count   Dtype  
    ---  ------       --------------   -----  
     0   InvoiceNo    541909 non-null  str    
     1   StockCode    541909 non-null  str    
     2   Description  540455 non-null  str    
     3   Quantity     541909 non-null  int64  
     4   InvoiceDate  541909 non-null  str    
     5   UnitPrice    541909 non-null  float64
     6   CustomerID   406829 non-null  float64
     7   Country      541909 non-null  str    
    dtypes: float64(2), int64(1), str(5)
    memory usage: 67.3 MB
    


```python
# Check basic statistics
df.describe()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Quantity</th>
      <th>UnitPrice</th>
      <th>CustomerID</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>541909.000000</td>
      <td>541909.000000</td>
      <td>406829.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>9.552250</td>
      <td>4.611114</td>
      <td>15287.690570</td>
    </tr>
    <tr>
      <th>std</th>
      <td>218.081158</td>
      <td>96.759853</td>
      <td>1713.600303</td>
    </tr>
    <tr>
      <th>min</th>
      <td>-80995.000000</td>
      <td>-11062.060000</td>
      <td>12346.000000</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>1.000000</td>
      <td>1.250000</td>
      <td>13953.000000</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>3.000000</td>
      <td>2.080000</td>
      <td>15152.000000</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>10.000000</td>
      <td>4.130000</td>
      <td>16791.000000</td>
    </tr>
    <tr>
      <th>max</th>
      <td>80995.000000</td>
      <td>38970.000000</td>
      <td>18287.000000</td>
    </tr>
  </tbody>
</table>
</div>



<h1>Step 2 — Check Missing Values & Duplicates</h1>


```python
# Check missing values in each column
df.isnull().sum()
```




    InvoiceNo           0
    StockCode           0
    Description      1454
    Quantity            0
    InvoiceDate         0
    UnitPrice           0
    CustomerID     135080
    Country             0
    dtype: int64




```python
# Calculate missing values and their percentage
missing_data = pd.DataFrame({
    "Missing Values": df.isnull().sum(),
    "Percentage": (df.isnull().sum() / len(df)) * 100
})

missing_data
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Missing Values</th>
      <th>Percentage</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>InvoiceNo</th>
      <td>0</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>StockCode</th>
      <td>0</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>Description</th>
      <td>1454</td>
      <td>0.268311</td>
    </tr>
    <tr>
      <th>Quantity</th>
      <td>0</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>InvoiceDate</th>
      <td>0</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>UnitPrice</th>
      <td>0</td>
      <td>0.000000</td>
    </tr>
    <tr>
      <th>CustomerID</th>
      <td>135080</td>
      <td>24.926694</td>
    </tr>
    <tr>
      <th>Country</th>
      <td>0</td>
      <td>0.000000</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Check total number of duplicate rows
df.duplicated().sum()
```




    np.int64(5268)




```python
# View duplicate records
df[df.duplicated()].head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>InvoiceNo</th>
      <th>StockCode</th>
      <th>Description</th>
      <th>Quantity</th>
      <th>InvoiceDate</th>
      <th>UnitPrice</th>
      <th>CustomerID</th>
      <th>Country</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>517</th>
      <td>536409</td>
      <td>21866</td>
      <td>UNION JACK FLAG LUGGAGE TAG</td>
      <td>1</td>
      <td>12/1/2010 11:45</td>
      <td>1.25</td>
      <td>17908.0</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>527</th>
      <td>536409</td>
      <td>22866</td>
      <td>HAND WARMER SCOTTY DOG DESIGN</td>
      <td>1</td>
      <td>12/1/2010 11:45</td>
      <td>2.10</td>
      <td>17908.0</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>537</th>
      <td>536409</td>
      <td>22900</td>
      <td>SET 2 TEA TOWELS I LOVE LONDON</td>
      <td>1</td>
      <td>12/1/2010 11:45</td>
      <td>2.95</td>
      <td>17908.0</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>539</th>
      <td>536409</td>
      <td>22111</td>
      <td>SCOTTIE DOG HOT WATER BOTTLE</td>
      <td>1</td>
      <td>12/1/2010 11:45</td>
      <td>4.95</td>
      <td>17908.0</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>555</th>
      <td>536412</td>
      <td>22327</td>
      <td>ROUND SNACK BOXES SET OF 4 SKULLS</td>
      <td>1</td>
      <td>12/1/2010 11:49</td>
      <td>2.95</td>
      <td>17920.0</td>
      <td>United Kingdom</td>
    </tr>
  </tbody>
</table>
</div>




```python
df.duplicated()
```




    0         False
    1         False
    2         False
    3         False
    4         False
              ...  
    541904    False
    541905    False
    541906    False
    541907    False
    541908    False
    Length: 541909, dtype: bool



<h1>Step 3 — Data Types & Date Validation</h1>


```python
# Check data types of all columns
df.dtypes
```




    InvoiceNo          str
    StockCode          str
    Description        str
    Quantity         int64
    InvoiceDate        str
    UnitPrice      float64
    CustomerID     float64
    Country            str
    dtype: object



<h2>Convert InvoiceDate to Datetime</h2>


```python
# Convert InvoiceDate to datetime format
df["InvoiceDate"] = pd.to_datetime(df["InvoiceDate"])
```


```python
# Check InvoiceDate data type
df["InvoiceDate"].dtype
```




    dtype('<M8[us]')




```python
# Find the earliest and latest invoice date
print("Start Date:", df["InvoiceDate"].min())
print("End Date:", df["InvoiceDate"].max())
```

    Start Date: 2010-12-01 08:26:00
    End Date: 2011-12-09 12:50:00
    


```python
# Check missing dates
df["InvoiceDate"].isnull().sum()
```




    np.int64(0)



<h1>Step 4 — Transaction & Sales Data Validation</h1>


```python
# Check quantity statistics
df["Quantity"].describe()
```




    count    541909.000000
    mean          9.552250
    std         218.081158
    min      -80995.000000
    25%           1.000000
    50%           3.000000
    75%          10.000000
    max       80995.000000
    Name: Quantity, dtype: float64




```python
# Count negative quantities
(df["Quantity"] < 0).sum()
```




    np.int64(10624)




```python
# Count zero quantities
(df["Quantity"] == 0).sum()
```




    np.int64(0)




```python
# Count zero quantities
(df["Quantity"] == 0).sum()
```




    np.int64(0)




```python
# Check unit price statistics
df["UnitPrice"].describe()
```




    count    541909.000000
    mean          4.611114
    std          96.759853
    min      -11062.060000
    25%           1.250000
    50%           2.080000
    75%           4.130000
    max       38970.000000
    Name: UnitPrice, dtype: float64




```python
# Count zero prices
(df["UnitPrice"] == 0).sum()
```




    np.int64(2515)




```python
# Count negative prices
(df["UnitPrice"] < 0).sum()
```




    np.int64(2)




```python
# Check cancelled invoices
df["InvoiceNo"].astype(str).str.startswith("C").sum()
```




    np.int64(9288)




```python
# View cancelled transactions
df[df["InvoiceNo"].astype(str).str.startswith("C")].head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>InvoiceNo</th>
      <th>StockCode</th>
      <th>Description</th>
      <th>Quantity</th>
      <th>InvoiceDate</th>
      <th>UnitPrice</th>
      <th>CustomerID</th>
      <th>Country</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>141</th>
      <td>C536379</td>
      <td>D</td>
      <td>Discount</td>
      <td>-1</td>
      <td>2010-12-01 09:41:00</td>
      <td>27.50</td>
      <td>14527.0</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>154</th>
      <td>C536383</td>
      <td>35004C</td>
      <td>SET OF 3 COLOURED&nbsp;&nbsp;FLYING DUCKS</td>
      <td>-1</td>
      <td>2010-12-01 09:49:00</td>
      <td>4.65</td>
      <td>15311.0</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>235</th>
      <td>C536391</td>
      <td>22556</td>
      <td>PLASTERS IN TIN CIRCUS PARADE</td>
      <td>-12</td>
      <td>2010-12-01 10:24:00</td>
      <td>1.65</td>
      <td>17548.0</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>236</th>
      <td>C536391</td>
      <td>21984</td>
      <td>PACK OF 12 PINK PAISLEY TISSUES</td>
      <td>-24</td>
      <td>2010-12-01 10:24:00</td>
      <td>0.29</td>
      <td>17548.0</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>237</th>
      <td>C536391</td>
      <td>21983</td>
      <td>PACK OF 12 BLUE PAISLEY TISSUES</td>
      <td>-24</td>
      <td>2010-12-01 10:24:00</td>
      <td>0.29</td>
      <td>17548.0</td>
      <td>United Kingdom</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Check quantity of cancelled transactions
df[df["InvoiceNo"].astype(str).str.startswith("C")]["Quantity"].describe()
```




    count     9288.000000
    mean       -29.885228
    std       1145.786965
    min     -80995.000000
    25%         -6.000000
    50%         -2.000000
    75%         -1.000000
    max         -1.000000
    Name: Quantity, dtype: float64



<h1>Step 5 — Missing CustomerID & Description Investigation</h1>


```python
# Count missing CustomerID
df["CustomerID"].isnull().sum()
```




    np.int64(135080)




```python
# Calculate percentage of missing CustomerID
customer_missing_pct = df["CustomerID"].isnull().mean() * 100

print("Missing CustomerID:", df["CustomerID"].isnull().sum())
print("Percentage:", customer_missing_pct)
```

    Missing CustomerID: 135080
    Percentage: 24.926694334288598
    

<h1>Descriptions missing Value</h1>


```python
# Count missing product descriptions
df["Description"].isnull().sum()
```




    np.int64(1454)




```python
# Calculate percentage of missing descriptions
description_missing_pct = df["Description"].isnull().mean() * 100

print("Missing Description:", df["Description"].isnull().sum())
print("Percentage:", description_missing_pct)
```

    Missing Description: 1454
    Percentage: 0.2683107311375157
    


```python
# Check quantity and price for missing descriptions
df[df["Description"].isnull()][
    ["InvoiceNo", "StockCode", "Quantity", "UnitPrice", "CustomerID", "Country"]
].head(10)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>InvoiceNo</th>
      <th>StockCode</th>
      <th>Quantity</th>
      <th>UnitPrice</th>
      <th>CustomerID</th>
      <th>Country</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>622</th>
      <td>536414</td>
      <td>22139</td>
      <td>56</td>
      <td>0.0</td>
      <td>NaN</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>1970</th>
      <td>536545</td>
      <td>21134</td>
      <td>1</td>
      <td>0.0</td>
      <td>NaN</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>1971</th>
      <td>536546</td>
      <td>22145</td>
      <td>1</td>
      <td>0.0</td>
      <td>NaN</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>1972</th>
      <td>536547</td>
      <td>37509</td>
      <td>1</td>
      <td>0.0</td>
      <td>NaN</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>1987</th>
      <td>536549</td>
      <td>85226A</td>
      <td>1</td>
      <td>0.0</td>
      <td>NaN</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>1988</th>
      <td>536550</td>
      <td>85044</td>
      <td>1</td>
      <td>0.0</td>
      <td>NaN</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>2024</th>
      <td>536552</td>
      <td>20950</td>
      <td>1</td>
      <td>0.0</td>
      <td>NaN</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>2025</th>
      <td>536553</td>
      <td>37461</td>
      <td>3</td>
      <td>0.0</td>
      <td>NaN</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>2026</th>
      <td>536554</td>
      <td>84670</td>
      <td>23</td>
      <td>0.0</td>
      <td>NaN</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>2406</th>
      <td>536589</td>
      <td>21777</td>
      <td>-10</td>
      <td>0.0</td>
      <td>NaN</td>
      <td>United Kingdom</td>
    </tr>
  </tbody>
</table>
</div>



<h1>Step 6 - StockCode & InvoiceNo Validation </h1>


```python
# Check number of unique invoices
df["InvoiceNo"].nunique()
```




    25900




```python
# Count cancelled invoices
cancelled_invoices = df["InvoiceNo"].astype(str).str.startswith("C")

print("Cancelled transactions:", cancelled_invoices.sum())
```

    Cancelled transactions: 9288
    


```python
# View cancelled transactions
df[cancelled_invoices].head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>InvoiceNo</th>
      <th>StockCode</th>
      <th>Description</th>
      <th>Quantity</th>
      <th>InvoiceDate</th>
      <th>UnitPrice</th>
      <th>CustomerID</th>
      <th>Country</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>141</th>
      <td>C536379</td>
      <td>D</td>
      <td>Discount</td>
      <td>-1</td>
      <td>2010-12-01 09:41:00</td>
      <td>27.50</td>
      <td>14527.0</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>154</th>
      <td>C536383</td>
      <td>35004C</td>
      <td>SET OF 3 COLOURED&nbsp;&nbsp;FLYING DUCKS</td>
      <td>-1</td>
      <td>2010-12-01 09:49:00</td>
      <td>4.65</td>
      <td>15311.0</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>235</th>
      <td>C536391</td>
      <td>22556</td>
      <td>PLASTERS IN TIN CIRCUS PARADE</td>
      <td>-12</td>
      <td>2010-12-01 10:24:00</td>
      <td>1.65</td>
      <td>17548.0</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>236</th>
      <td>C536391</td>
      <td>21984</td>
      <td>PACK OF 12 PINK PAISLEY TISSUES</td>
      <td>-24</td>
      <td>2010-12-01 10:24:00</td>
      <td>0.29</td>
      <td>17548.0</td>
      <td>United Kingdom</td>
    </tr>
    <tr>
      <th>237</th>
      <td>C536391</td>
      <td>21983</td>
      <td>PACK OF 12 BLUE PAISLEY TISSUES</td>
      <td>-24</td>
      <td>2010-12-01 10:24:00</td>
      <td>0.29</td>
      <td>17548.0</td>
      <td>United Kingdom</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Check number of unique stock codes
df["StockCode"].nunique()
```




    4070




```python
# View the most common stock codes
df["StockCode"].value_counts().head(20)
```




    StockCode
    85123A    2313
    22423     2203
    85099B    2159
    47566     1727
    20725     1639
    84879     1502
    22720     1477
    22197     1476
    21212     1385
    20727     1350
    22383     1348
    22457     1280
    23203     1267
    POST      1256
    22386     1251
    22469     1239
    22960     1229
    21931     1214
    22086     1210
    22411     1202
    Name: count, dtype: int64




```python
# Check stock code lengths
df["StockCode"].astype(str).str.len().value_counts().sort_index()
```




    StockCode
    1        715
    2        144
    3        710
    4       1276
    5     487036
    6      51488
    7        390
    8         31
    9         48
    12        71
    Name: count, dtype: int64



<h1>Step 7 -Final Cleaning Decisions & Transformation</h1>


```python
# Remove exact duplicate rows
df = df.drop_duplicates()
```


```python
# Check duplicates after removal
df.duplicated().sum()
```




    np.int64(0)



<h3>Remove Invalid Quantity Records</h3>


```python
# Keep transactions with positive quantity
df = df[df["Quantity"] > 0]
```


```python
# Keep transactions with a positive unit price
df = df[df["UnitPrice"] > 0]
```

<h3>Create Revenue Column</h3>


```python
# Calculate revenue for each transaction
df["Revenue"] = df["Quantity"] * df["UnitPrice"]
```

<h2>Final Data Check</h2>


```python
# Check final dataset shape
df.shape
```




    (524878, 9)




```python
# Check missing values
df.isnull().sum()
```




    InvoiceNo           0
    StockCode           0
    Description         0
    Quantity            0
    InvoiceDate         0
    UnitPrice           0
    CustomerID     132186
    Country             0
    Revenue             0
    dtype: int64




```python
# Check duplicate rows
df.duplicated().sum()
```




    np.int64(0)




```python
# Check quantity
df["Quantity"].describe()
```




    count    524878.000000
    mean         10.616600
    std         156.280031
    min           1.000000
    25%           1.000000
    50%           4.000000
    75%          11.000000
    max       80995.000000
    Name: Quantity, dtype: float64




```python
# Check unit price
df["UnitPrice"].describe()
```




    count    524878.000000
    mean          3.922573
    std          36.093028
    min           0.001000
    25%           1.250000
    50%           2.080000
    75%           4.130000
    max       13541.330000
    Name: UnitPrice, dtype: float64




```python
# Check revenue
df["Revenue"].describe()
```




    count    524878.000000
    mean         20.275399
    std         271.693566
    min           0.001000
    25%           3.900000
    50%           9.920000
    75%          17.700000
    max      168469.600000
    Name: Revenue, dtype: float64



<h1>Step 8 - Save & Export Clean Dataset</h1>


```python
# # Save cleaned data
 df.to_csv(r"C:\Users\ankit\OneDrive\Desktop\Ecommerse Sales Analysis\Data\Processed/clean_sales_data.csv", index=False)
```


```python
# Load the cleaned dataset
clean_df = pd.read_csv(r"C:\Users\ankit\OneDrive\Desktop\Ecommerse Sales Analysis\Data/Processed/clean_sales_data.csv")
```

    C:\Users\ankit\AppData\Local\Temp\ipykernel_3112\4081345750.py:2: DtypeWarning: Columns (0: InvoiceNo) have mixed types. Specify dtype option on import or set low_memory=False.
      clean_df = pd.read_csv(r"C:\Users\ankit\OneDrive\Desktop\Ecommerse Sales Analysis\Data/Processed/clean_sales_data.csv")
    


```python
clean_df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>InvoiceNo</th>
      <th>StockCode</th>
      <th>Description</th>
      <th>Quantity</th>
      <th>InvoiceDate</th>
      <th>UnitPrice</th>
      <th>CustomerID</th>
      <th>Country</th>
      <th>Revenue</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>536365</td>
      <td>85123A</td>
      <td>WHITE HANGING HEART T-LIGHT HOLDER</td>
      <td>6</td>
      <td>2010-12-01 08:26:00</td>
      <td>2.55</td>
      <td>17850.0</td>
      <td>United Kingdom</td>
      <td>15.30</td>
    </tr>
    <tr>
      <th>1</th>
      <td>536365</td>
      <td>71053</td>
      <td>WHITE METAL LANTERN</td>
      <td>6</td>
      <td>2010-12-01 08:26:00</td>
      <td>3.39</td>
      <td>17850.0</td>
      <td>United Kingdom</td>
      <td>20.34</td>
    </tr>
    <tr>
      <th>2</th>
      <td>536365</td>
      <td>84406B</td>
      <td>CREAM CUPID HEARTS COAT HANGER</td>
      <td>8</td>
      <td>2010-12-01 08:26:00</td>
      <td>2.75</td>
      <td>17850.0</td>
      <td>United Kingdom</td>
      <td>22.00</td>
    </tr>
    <tr>
      <th>3</th>
      <td>536365</td>
      <td>84029G</td>
      <td>KNITTED UNION FLAG HOT WATER BOTTLE</td>
      <td>6</td>
      <td>2010-12-01 08:26:00</td>
      <td>3.39</td>
      <td>17850.0</td>
      <td>United Kingdom</td>
      <td>20.34</td>
    </tr>
    <tr>
      <th>4</th>
      <td>536365</td>
      <td>84029E</td>
      <td>RED WOOLLY HOTTIE WHITE HEART.</td>
      <td>6</td>
      <td>2010-12-01 08:26:00</td>
      <td>3.39</td>
      <td>17850.0</td>
      <td>United Kingdom</td>
      <td>20.34</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Check shape of cleaned dataset
clean_df.shape
```




    (524878, 9)




```python
# Check columns
clean_df.columns
```




    Index(['InvoiceNo', 'StockCode', 'Description', 'Quantity', 'InvoiceDate',
           'UnitPrice', 'CustomerID', 'Country', 'Revenue'],
          dtype='str')




```python
# Convert InvoiceDate back to datetime after loading
clean_df["InvoiceDate"] = pd.to_datetime(clean_df["InvoiceDate"])
```


```python
# Check data types
clean_df.dtypes
```




    InvoiceNo              object
    StockCode                 str
    Description               str
    Quantity                int64
    InvoiceDate    datetime64[us]
    UnitPrice             float64
    CustomerID            float64
    Country                   str
    Revenue               float64
    dtype: object




```python
# Check missing values
clean_df.isnull().sum()
```




    InvoiceNo           0
    StockCode           0
    Description         0
    Quantity            0
    InvoiceDate         0
    UnitPrice           0
    CustomerID     132186
    Country             0
    Revenue             0
    dtype: int64




```python
# Check duplicate records
clean_df.duplicated().sum()
```




    np.int64(0)




```python
# Check for invalid quantity
(clean_df["Quantity"] <= 0).sum()
```




    np.int64(0)




```python
# Check for invalid unit price
(clean_df["UnitPrice"] <= 0).sum()
```




    np.int64(0)




```python
# Check revenue
clean_df["Revenue"].describe()
```




    count    524878.000000
    mean         20.275399
    std         271.693566
    min           0.001000
    25%           3.900000
    50%           9.920000
    75%          17.700000
    max      168469.600000
    Name: Revenue, dtype: float64


