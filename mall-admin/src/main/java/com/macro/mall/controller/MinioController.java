package com.macro.mall.controller;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.json.JSONUtil;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.dto.BucketPolicyConfigDto;
import com.macro.mall.dto.MinioUploadDto;
import io.minio.BucketExistsArgs;
import io.minio.MakeBucketArgs;
import io.minio.MinioClient;
import io.minio.ObjectWriteArgs;
import io.minio.PutObjectArgs;
import io.minio.RemoveObjectArgs;
import io.minio.SetBucketPolicyArgs;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * MinIO对象存储管理.
 */
@Slf4j
@Api(tags = "MinioController", description = "MinIO对象存储管理")
@Controller
@RequestMapping("/minio")
public class MinioController {

    @Value("${minio.endpoint}")
    private String ENDPOINT;
    @Value("${minio.bucketName}")
    private String BUCKET_NAME;
    @Value("${minio.accessKey}")
    private String ACCESS_KEY;
    @Value("${minio.secretKey}")
    private String SECRET_KEY;

    @ApiOperation("文件上传")
    @PostMapping(value = "/upload")
    @ResponseBody
    public CommonResult<?> upload(@RequestParam("file") final MultipartFile file) {
        try {
            //创建一个MinIO的Java客户端
            final MinioClient minioClient = MinioClient.builder()
                    .endpoint(ENDPOINT)
                    .credentials(ACCESS_KEY, SECRET_KEY)
                    .build();
            final boolean isExist = minioClient.bucketExists(BucketExistsArgs.builder().bucket(BUCKET_NAME).build());
            if (isExist) {
                log.info("存储桶已经存在！");
            } else {
                //创建存储桶并设置只读权限
                minioClient.makeBucket(MakeBucketArgs.builder().bucket(BUCKET_NAME).build());
                BucketPolicyConfigDto bucketPolicyConfigDto = createBucketPolicyConfigDto(BUCKET_NAME);
                SetBucketPolicyArgs setBucketPolicyArgs = SetBucketPolicyArgs.builder()
                        .bucket(BUCKET_NAME)
                        .config(JSONUtil.toJsonStr(bucketPolicyConfigDto))
                        .build();
                minioClient.setBucketPolicy(setBucketPolicyArgs);
            }
            final String filename = file.getOriginalFilename();
            final SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
            // 设置存储对象名称
            final String objectName = sdf.format(new Date()) + "/" + filename;
            // 使用putObject上传一个文件到存储桶中
            final PutObjectArgs putObjectArgs = PutObjectArgs.builder()
                    .bucket(BUCKET_NAME)
                    .object(objectName)
                    .contentType(file.getContentType())
                    .stream(file.getInputStream(), file.getSize(), ObjectWriteArgs.MIN_MULTIPART_SIZE).build();
            minioClient.putObject(putObjectArgs);
            log.info("文件上传成功!");
            MinioUploadDto minioUploadDto = new MinioUploadDto();
            minioUploadDto.setName(filename);
            minioUploadDto.setUrl(ENDPOINT + "/" + BUCKET_NAME + "/" + objectName);
            return CommonResult.success(minioUploadDto);
        } catch (Exception e) {
            log.error("上传发生错误: {}！", e.getMessage());
        }
        return CommonResult.failed();
    }

    private BucketPolicyConfigDto createBucketPolicyConfigDto(final String bucketName) {
        final BucketPolicyConfigDto.Statement statement = BucketPolicyConfigDto.Statement.builder()
                .Effect("Allow")
                .Principal("*")
                .Action("s3:GetObject")
                .Resource("arn:aws:s3:::" + bucketName + "/*.**").build();
        return BucketPolicyConfigDto.builder()
                .Version("2012-10-17")
                .Statement(CollUtil.toList(statement))
                .build();
    }

    @ApiOperation("文件删除")
    @PostMapping(value = "/delete")
    @ResponseBody
    public CommonResult<?> delete(@RequestParam("objectName") final String objectName) {
        try {
            final MinioClient minioClient = MinioClient.builder()
                    .endpoint(ENDPOINT)
                    .credentials(ACCESS_KEY, SECRET_KEY)
                    .build();
            minioClient.removeObject(RemoveObjectArgs.builder().bucket(BUCKET_NAME).object(objectName).build());
            return CommonResult.success(null);
        } catch (Exception e) {
            log.error("删除发生错误: {} - {}！", objectName, e.getMessage());
        }
        return CommonResult.failed();
    }
}
