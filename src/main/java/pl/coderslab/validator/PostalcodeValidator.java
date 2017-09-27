package pl.coderslab.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PostalcodeValidator implements ConstraintValidator<Postalcode, String>{

	@Override
	public void initialize(Postalcode constraintAnnotation) {
	}

	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		Pattern pattern = Pattern.compile("[0-9]{2}\\-[0-9]{3}");
		Matcher match = pattern.matcher(value);
		return match.matches();
	}

}
