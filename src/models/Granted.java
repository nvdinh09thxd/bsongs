package models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Granted {
	int id ;
	int add;
	int edit;
	int del;
	int granted;
}
