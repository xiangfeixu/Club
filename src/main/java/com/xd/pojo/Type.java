package com.xd.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@Accessors(chain=true)
@TableName(value="type")
@NoArgsConstructor
@AllArgsConstructor
public class Type {

	@TableId(type=IdType.AUTO)
	private Integer id;
	private String content;
}
