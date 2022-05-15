package model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Bill {
	// A common method to connect to the DB
	private Connection connect() {
		Connection con = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			// Provide the correct details: DBServer/DBName, username, password
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electrogridclient", "root", "");

			// For testing
			System.out.print("Successfully connected");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return con;
	}

	public String readBill() {
		String output = "";

		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for reading.";
			}

			// Prepare the html table to be displayed
			output = "<table border='1'><tr><th>Bill Amount</th><th>Bill Date</th>" + "<th>Paid Amount</th>"
					+ "<th>Status</th>" + "<th>Update</th><th>Remove</th></tr>";

			String query = "select * from bill";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);

			// iterate through the rows in the result set
			while (rs.next()) {

				String billNo = Integer.toString(rs.getInt("billNo"));
				String billAmount = Integer.toString(rs.getInt("billAmount"));
				String billDate = rs.getString("billDate");
				String paidAmount = Integer.toString(rs.getInt("paidAmount"));
				String status = rs.getString("status");

				// Add into the html table

				output += "<tr><td><input id='hidbillNoUpdate' name='hidbillNoUpdate' type='hidden' value='"
						+ billNo + "'>" + billAmount + "</td>";

				output += "<td>" + billDate + "</td>";
				output += "<td>" + paidAmount + "</td>";
				output += "<td>" + status + "</td>";

				// buttons
				output += "<td><input name='btnUpdate' type='button' value='Update' class='btnUpdate btn btn-secondary'></td>"
						+ "<td><input name='btnRemove' type='button' value='Remove' class='btnRemove btn btn-danger' data-billNo='"
						+ billNo + "'>" + "</td></tr>";

			}

			con.close();

			// Complete the html table
			output += "</table>";
		} catch (Exception e) {
			output = "Error while reading the Bill Details.";
			System.err.println(e.getMessage());
		}

		return output;
	}

	// Insert Bill
	public String insertBill(String billAmount, String billDate, String paidAmount,
			String status) {
		String output = "";

		try {
			Connection con = connect();

			if (con == null) {
				return "Error while connecting to the database";
			}

			// create a prepared statement
			String query = " insert into bill (`billNo`,`billAmount`,`billDate`,`paidAmount`,`status`)"
					+ " values (?, ?, ?, ?, ?)";

			PreparedStatement preparedStmt = con.prepareStatement(query);

			// binding values
			preparedStmt.setInt(1, 0);
			preparedStmt.setString(2, billAmount);
			preparedStmt.setString(3, billDate);
			preparedStmt.setString(4, paidAmount);
			preparedStmt.setString(5, status);

			// execute the statement
			preparedStmt.execute();
			con.close();

			// Create JSON Object to show successful msg.
			String newBill = readBill();
			output = "{\"status\":\"success\", \"data\": \"" + newBill + "\"}";
		} catch (Exception e) {
			// Create JSON Object to show Error msg.
			output = "{\"status\":\"error\", \"data\": \"Error while Inserting Bill.\"}";
			System.err.println(e.getMessage());
		}

		return output;
	}

	// Update Bill
	public String updateBill(String billNo, String billAmount, String billDate, String paidAmount,
			String status) {
		String output = "";

		try {
			Connection con = connect();

			if (con == null) {
				return "Error while connecting to the database for updating.";
			}

			// create a prepared statement
			String query = "UPDATE bill SET billAmount=?,billDate=?,paidAmount=?,status=? WHERE billNo=?";

			PreparedStatement preparedStmt = con.prepareStatement(query);

			// binding values
			preparedStmt.setInt(1, Integer.parseInt(billAmount));
			preparedStmt.setString(2, billDate);
			preparedStmt.setInt(3, Integer.parseInt(paidAmount));
			preparedStmt.setString(4, status);
			preparedStmt.setInt(5, Integer.parseInt(billNo));

			// execute the statement
			preparedStmt.execute();
			con.close();

			// create JSON object to show successful msg
			String newBill = readBill();
			output = "{\"status\":\"success\", \"data\": \"" + newBill + "\"}";
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\": \"Error while Updating Bill Details.\"}";
			System.err.println(e.getMessage());
		}

		return output;
	}

	public String deleteBill(String billNo) {
		String output = "";

		try {
			Connection con = connect();

			if (con == null) {
				return "Error while connecting to the database for deleting.";
			}

			// create a prepared statement
			String query = "DELETE FROM bill WHERE billNo=?";

			PreparedStatement preparedStmt = con.prepareStatement(query);

			// binding values
			preparedStmt.setInt(1, Integer.parseInt(billNo));
			// execute the statement
			preparedStmt.execute();
			con.close();

			// create JSON Object
			String newBill = readBill();
			output = "{\"status\":\"success\", \"data\": \"" + newBill + "\"}";
		} catch (Exception e) {
			// Create JSON object
			output = "{\"status\":\"error\", \"data\": \"Error while Deleting Bill.\"}";
			System.err.println(e.getMessage());

		}

		return output;
	}

}
