package models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Granted {
	int id ;
	String name;
	int add;
	int edit;
	int del;
}
