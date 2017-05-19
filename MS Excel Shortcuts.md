> **Insert row & column quickly**

**Step 1**: Select the row/column, above/before you want to insert new row.

**Step 2**: Press `Ctrl & '+'`, you are done.

> **Count cell contains specific text**

**Problem** : If you have column A filled text 'FAIL' & 'PASS'. You want count 'FAIL' cases.

**Step 1**: Select a blank cell, enter the formula `=COUNTIF(A2:A6,"FAIL")` & press the Enter key.

You can use `*` for wildcard search.

> **Select the filled area**

**Problem** : If you have column A filled from A2 to A90 & you want to select all filled data.

**Step 1**: Select cell `A2`.

**Step 2**: Press `Shift + Ctrl + <DOWN_ARROW>`. you are done.

> **Insert alternate blank row**

**Problem** : I have data filled from A1 to A4 continuously. I want to insert alternate blank row.

**Step 1**: You need a blank column adjacent to your data. For example, `A1` to `A4` is our origin data, then we column B.

**Step 2**: In cell `B1` input the no 1, input 2 in cell `B2` & drag it till `B4`, Excel will auto-fill the cells in column B.

**Step 3**: Copy this new column B (B1:B4), select the cell `B5`, and paste.

**Step 4**: And then click `Data` -> `Sort`, and a Sort Warning dialog box will pop out, select `Expand the selection` option, and click `Sort`.

**Step 5**. And a Sort dialog box will appear, choose `Column B` from the `Sort by` dropdown list. And click `OK`.


> **Separate string on delimiter**

**Problem** : Separate string on delimiter. For example column C contains data having `,` in between.

**Step 1**: Select the column C.

**Step 2**: And then click `Data` -> `Text to Column`, Check `Delimited` & click `Next`.

**Step 3**: Check `Other`, fill the delimiter & click `Next` & `Finish`. We are done. 

> **Concatenate multiple strings**
