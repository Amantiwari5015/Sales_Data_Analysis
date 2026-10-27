# 🛒 Online Retail Sales Analysis | Python · SQL · Power BI

An end-to-end data analysis project on **525K+ transactions** from a UK-based online retailer. It covers data cleaning in Python, business analysis in SQL, and an interactive 2-page Power BI dashboard.

![Sales Overview Dashboard](Dashboard/Sales_Overview.png)

---

## 📌 Business Problem

The company sells gift and home-decor products online, mostly to wholesale buyers. Management wants to know:

- How much revenue are we making, and how does it change month to month?
- Which countries bring in the most revenue?
- Which products sell the most, by revenue and by quantity?
- Who are our most valuable customers, and how many come back to buy again?

---

## 📂 Dataset

| Item | Detail |
|---|---|
| Source | [UCI Machine Learning Repository: Online Retail](https://archive.ics.uci.edu/dataset/352/online+retail) |
| Period | 1 Dec 2010 – 9 Dec 2011 |
| Raw rows | 541,909 |
| Clean rows | 524,878 |
| Columns | InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country, Revenue (added) |
| Currency | British Pound (£) |

> The CSV files are not uploaded because of their size. Download the dataset from the link above and place it in `Data/Raw/`.

---

## 🛠️ Tools Used

| Tool | Purpose |
|---|---|
| **Python** (Pandas, NumPy, Matplotlib) | Data cleaning and exploratory data analysis |
| **MySQL** | Business questions and KPI analysis |
| **Power BI** | Interactive dashboard and DAX measures |
| **GitHub** | Version control and portfolio |

---

## 🔄 Project Workflow

```
Raw Data  →  Data Cleaning (Python)  →  EDA (Python)  →  SQL Analysis  →  Power BI Dashboard  →  Insights
```

### 1. Data Cleaning (`Notbook/01_Data_Cleaning_v2.ipynb`)
- Removed cancelled orders (InvoiceNo starting with "C")
- Removed rows with zero or negative Quantity and UnitPrice
- Removed duplicate rows
- Converted InvoiceDate to datetime
- Created a new column: `Revenue = Quantity × UnitPrice`

### 2. Exploratory Data Analysis (`Notbook/02_Exploratory_Data_Analysis.ipynb`)
- Dataset overview and summary statistics
- Missing values check (about 25% of rows have no CustomerID: guest purchases)
- Monthly, country-level and product-level patterns

### 3. SQL Analysis (`Sql/`)
| File | Questions answered |
|---|---|
| `01_Sales_Analysis.sql` | Total revenue, total orders, AOV, best month, top countries, top products |
| `02_Customer_Analysis.sql` | Unique customers, top customers, revenue per customer, repeat customers |
| `03_Product_Analysis.sql` | Unique products, top products by revenue / quantity / orders, average price |
| `04_Business_Questions.sql` | Peak month, top market, top-10 customer dependency, repeat rate, high-volume vs high-value products |

### 4. Power BI Dashboard (`Dashboard/Sales_Dashboard.pbix`)

**Page 1: Sales Overview**
- KPI cards: Total Revenue, Total Orders, Total Customers, Average Order Value
- Line chart: Monthly revenue trend
- Bar chart: Top 5 countries by revenue
- Column chart: Orders by month
- Slicers: Country, Year-Month

**Page 2: Products & Customers**
- KPI cards: Total Quantity Sold, Total Products
- Bar charts: Top 10 products by revenue and by quantity
- Customer and country revenue breakdown

![Product & Customer Dashboard](Dashboard/Product_Customer.png)

**DAX measures used**
```DAX
Total Revenue   = SUM(clean_sales_data[Revenue])
Total Orders    = DISTINCTCOUNT(clean_sales_data[InvoiceNo])
Total Customers = DISTINCTCOUNTNOBLANK(clean_sales_data[CustomerID])
Avg Order Value = DIVIDE([Total Revenue], [Total Orders])
Total Quantity  = SUM(clean_sales_data[Quantity])
Total Products  = DISTINCTCOUNT(clean_sales_data[StockCode])
```

---

## 📊 Key KPIs

| KPI | Value |
|---|---|
| Total Revenue | **£10.64M** |
| Total Orders | **19,960** |
| Total Customers | **4,338** |
| Average Order Value | **£533** |
| Total Quantity Sold | **5.57M units** |
| Unique Products | **3,922** |
| Countries | **38** |

---

## 💡 Key Insights

1. **Strong seasonality:** Revenue grew from £757K in August 2011 to a peak of **£1.50M in November 2011**, driven by holiday-season orders. (December 2011 looks low only because the data ends on 9 December.)
2. **Heavy UK dependence:** The **United Kingdom brings in 84.6%** of total revenue. The next markets (Netherlands, EIRE, Germany, France) each bring in only about 2–3%.
3. **Loyal customer base:** **65.6% of customers are repeat buyers**, and the **top 20% of customers bring in 74.7%** of customer revenue (the 80/20 rule).
4. **Customer concentration:** The **top 10 customers alone bring in 17.3%** of identified-customer revenue, a risk if any of them leave.
5. **Product winners:** **REGENCY CAKESTAND 3 TIER** (£174K), **WHITE HANGING HEART T-LIGHT HOLDER** (£106K) and **PARTY BUNTING** (£99K) lead in revenue, while low-priced items such as **WORLD WAR 2 GLIDERS** and **JUMBO BAG RED RETROSPOT** lead in quantity.
6. **B2B buying pattern:** Orders come in on weekdays between 8 AM and 5 PM, with **no Saturday sales**, which shows most buyers are wholesalers.

---

## ✅ Recommendations

- **Prepare for Q4 early:** Build stock and run marketing campaigns from August to get the most out of the Sep–Nov peak.
- **Grow outside the UK:** Target the Netherlands, EIRE, Germany and France to reduce dependence on one market.
- **Reward top customers:** Start a loyalty or volume-discount programme for the top 20% of customers.
- **Convert one-time buyers:** About 34% of customers bought only once; follow-up emails and offers can bring them back.
- **Bundle best-sellers:** Pair high-volume, low-price items with high-revenue products to raise the average order value.

---

## 📁 Repository Structure

```
Ecommerce-Sales-Analysis/
│
├── Dashboard/
│   ├── Sales_Dashboard.pbix
│   ├── Sales_Overview.png
│   └── Product_Customer.png
│
├── Data/
│   ├── Raw/            # Online Retail.csv (download from UCI)
│   └── Processed/      # clean_sales_data.csv (created by the cleaning notebook)
│
├── Notbook/
│   ├── 01_Data_Cleaning_v2.ipynb
│   └── 02_Exploratory_Data_Analysis.ipynb
│
├── Sql/
│   ├── 01_Sales_Analysis.sql
│   ├── 02_Customer_Analysis.sql
│   ├── 03_Product_Analysis.sql
│   └── 04_Business_Questions.sql
│
└── README.md
```

---

## ▶️ How to Run

1. Clone this repository
   ```bash
   git clone https://github.com/<your-username>/Ecommerce-Sales-Analysis.git
   ```
2. Download the dataset from UCI and place it in `Data/Raw/`
3. Run `Notbook/01_Data_Cleaning_v2.ipynb` to create `clean_sales_data.csv`
4. Import `clean_sales_data.csv` into MySQL as `online_retail_db.clean_sales_data` and run the files in `Sql/`
5. Open `Dashboard/Sales_Dashboard.pbix` in Power BI Desktop

---

## 👤 Author

**Your Name**
Data Analyst | Python · SQL · Power BI | Open to freelance projects

- 📧 Email: amantiwari5015@gmail.com
- 💼 LinkedIn: *add your LinkedIn link*
- 🌐 Portfolio: *add your portfolio link*

⭐ If you found this project useful, please give it a star!
