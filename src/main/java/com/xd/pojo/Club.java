package com.xd.pojo;

import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@Accessors(chain=true)
@TableName(value="club")
@NoArgsConstructor
@AllArgsConstructor
public class Club {

	@TableId(type=IdType.AUTO)
	private Integer id;
	private String name;
	private String charger;
	private String type;
	private Date founded;
	private Integer number;
	private Integer member;
	private String note;
}
