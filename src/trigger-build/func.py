import io
import os
import json
import logging
import oci
from fdk import response


def handler(ctx, data: io.BytesIO = None):
    logging.getLogger().info("Trigger Build Pipeline")
    
    body = json.loads(data.getvalue())
    build_id = os.environ['build_id'] #obtain from function config
    model_name = body["data"]["resourceName"] #obtain from event
    model_id = body["data"]["resourceId"] #obtain from event

    signer = oci.auth.signers.get_resource_principals_signer()
    devops_client = oci.devops.DevopsClient(config={},signer=signer)

    create_build_run_response = devops_client.create_build_run(
        create_build_run_details=oci.devops.models.CreateBuildRunDetails(
            build_pipeline_id=build_id,
            build_run_arguments=oci.devops.models.BuildRunArgumentCollection(
                items=[
                    oci.devops.models.BuildRunArgument(
                        name="DISP_NAME",
                        value=model_name),
                    oci.devops.models.BuildRunArgument(
                        name="MODEL_ID",
                        value=model_id)
                    ])
        )
    )
    # Get the data from response
    print(create_build_run_response.data)
    logging.getLogger().info("Trigger Build Pipeline successfully")