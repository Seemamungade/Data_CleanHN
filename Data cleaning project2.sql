SELECT * FROM `nashville housing`;

SELECT SaleDate, CONVERT(date, SaleDate)
FROM nashville housing;

Update nashville housing
set Saledate = CONVERT(date, SaleDate);

Alter table `nashville housing`
Add ConvertedDate1 date;

update `nashville housing`
set ConvertedDate1 = convert(Date, Saledate);

select saledate, ConvertedDate from `nashville housing`;

-- Property Address 
SELECT PropertyAddress FROM `nashville housing`;

SELECT * FROM `nashville housing`
-- Where PropertyAddress Is Null;
order by ParcelID;      -- where Pid=pid then Padd = padd

-- self join to fill null Address
SELECT A.ParcelID, A.PropertyAddress, B.ParcelID, B.PropertyAddress, 
ISNULL(A.PropertyAddress, B.PropertyAddress )
FROM `nashville housing` as A
join  `nashville housing` as B 
on A.ParcelID = B.ParcelID
And A.UniqueID <> B.UniqueID
where A.PropertyAddress is null;

update A
set propertyAddress = ISNULL(A.PropertyAddress, B.PropertyAddress )
FROM `nashville housing` as A
join  `nashville housing` as B 
on A.ParcelID = B.ParcelID
And A.UniqueID <> B.UniqueID
where A.PropertyAddress is null;

-- Separating city, state from propertyAddress
SELECT PropertyAddress FROM `nashville housing`;

-- Address
select substring(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1) as Address,
substring(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress))
FROM `nashville housing`;

Alter Table `nashville housing`
Add SplitAddress Varchar(255);

update `nashville housing`
set SplitAddress = substring(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1);

Alter Table `nashville housing`
Add SplitCity Varchar(255);

update `nashville housing`
set SplitCity = substring(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress));

-- Owner Address 
use schema2;
SELECT OwnerAddress FROM `nashville housing`;

SELECT PARSENAME(replace(OwnerAddress,',', '.') , 3)  -- Sql server (mysql- sunstring index fun)
PARSENAME(replace(OwnerAddress,',', '.') , 2)
PARSENAME(replace(OwnerAddress,',', '.') , 1)
FROM `nashville housing`;

Alter Table `nashville housing`
Add OwnerSplitAddress Varchar(255);

update `nashville housing`
set OwnerSplitAddress = PARSENAME(replace(OwnerAddress,',', '.') , 3);

Alter Table `nashville housing`
Add OwnerSplitCity Varchar(255);

update `nashville housing`
set OwnerSplitCity = PARSENAME(replace(OwnerAddress,',', '.') , 2);

Alter Table `nashville housing`
Add OwnerSplitState Varchar(255);

update `nashville housing`
set OwnerSplitState = PARSENAME(replace(OwnerAddress,',', '.') , 1));

-- SoldAsVacant
SELECT distinct SoldAsVacant,count(SoldAsVacant)
from  `nashville housing` 
group by SoldAsVacant 
Order by 2 DESC;
select SoldAsVacant,
CASE when SoldAsVacant = "N" then "No"
     When SoldAsVacant = "Y" then "Yes"
     else SoldAsVacant
END
from  `nashville housing`;

Update `nashville housing`
SET SoldAsVacant = CASE when SoldAsVacant = "N" then "No"
     When SoldAsVacant = "Y" then "Yes"
     else SoldAsVacant
END;

-- Remove/Drop Unused Columns 
Select* from  `nashville housing`; 

-- Alter Table `nashville housing`
-- Drop Column PropertyAddress, OwnerAddress, TaxDistrict;




















 FROM `nashville housing`
 group by SoldAsVacant; 






