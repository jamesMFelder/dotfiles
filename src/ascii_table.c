#include <stdio.h>

char const * control_pictures[] = {
	"␀",
	"␁",
	"␂",
	"␃",
	"␄",
	"␅",
	"␆",
	"␇",
	"␈",
	"␉",
	"␊",
	"␋",
	"␌",
	"␍",
	"␎",
	"␏",
	"␐",
	"␑",
	"␒",
	"␓",
	"␔",
	"␕",
	"␖",
	"␗",
	"␘",
	"␙",
	"␚",
	"␛",
	"␜",
	"␝",
	"␞",
	"␟",
	" ",
	"!",
	"\"",
	"#",
	"$",
	"%",
	"&",
	"'",
	"(",
	")",
	"*",
	"+",
	",",
	"-",
	".",
	"/",
	"0",
	"1",
	"2",
	"3",
	"4",
	"5",
	"6",
	"7",
	"8",
	"9",
	":",
	";",
	"<",
	"=",
	">",
	"?",
	"@",
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"G",
	"H",
	"I",
	"J",
	"K",
	"L",
	"M",
	"N",
	"O",
	"P",
	"Q",
	"R",
	"S",
	"T",
	"U",
	"V",
	"W",
	"X",
	"Y",
	"Z",
	"[",
	"\\",
	"]",
	"^",
	"_",
	"`",
	"a",
	"b",
	"c",
	"d",
	"e",
	"f",
	"g",
	"h",
	"i",
	"j",
	"k",
	"l",
	"m",
	"n",
	"o",
	"p",
	"q",
	"r",
	"s",
	"t",
	"u",
	"v",
	"w",
	"x",
	"y",
	"z",
	"{",
	"|",
	"}",
	"~",
	"␡",
};

char const * char_for_num(char c) {
	if (c < sizeof(control_pictures)) {
		return control_pictures[c];
	}
	else {
		return "";
	}
}

int main(){
	int i, j;
	printf("   ");
	for(i=0;i<10;i++){
		printf("%2d", i);
	}
	printf("\n");
	for(i=0;i<10;i++){
		printf("--");
	}
	printf("\n");
	for(i=0;i<13;i++){
		printf("%2d|", i);
		for(j=0;j<10;j++){
			printf(" %s", char_for_num(i*10+j));
		}
		printf("\n");
	}
	return 0;
}
